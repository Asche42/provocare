require 'csv'
require 'securerandom'

class AdminController < ApplicationController
  before_action :verify_is_admin
  USER_KEYS = [:password, :lastname, :firstname, :email, :promotion]

  def batch_processing
    @results = []

    if params[:csv_content]
      begin
        User.transaction do # Let's make it a transaction so that every record is discarded if the CSV is invalid.
          CSV.parse(params[:csv_content]) do |row|
            @results << User.create!(Hash[USER_KEYS.zip([SecureRandom.urlsafe_base64] + row)])
          end
        end

        # Sending confirmation emails.
        @results.each do |result|
          UserMailer.welcome_email(result).deliver
        end

        flash[:success] = "Utilisateurs ajoutés"
      rescue ActiveRecord::RecordInvalid => e
        @results = []
        flash[:error] = "Le fichier CSV est invalide. Erreur : #{e.message}."
      end
    end
  end

  def frontpage
  end

  def add_user
    @result = nil

    if params[:email]
      begin
        @result = User.create!({ :password => SecureRandom.urlsafe_base64 }.merge(user_params))
        # Sending confirmation email.
        UserMailer.welcome_email(@result).deliver
        flash[:success] = "Utilisateur ajouté."
      rescue ActiveRecord::RecordInvalid => e
        @result = nil
        flash[:error] = "Une erreur est survenue lors de l'insertion des données : #{e.message}."
      end
    end
  end

  private

  def user_params
    params.permit(USER_KEYS)
  end
end

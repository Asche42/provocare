require 'csv'
require 'securerandom'

class AdminController < ApplicationController
  before_action :verify_is_admin

  def batch_processing
    user_keys = [:password, :lastname, :firstname, :email, :promotion]
    @results = []

    if params[:csv_content]
      begin
        User.transaction do # Let's make it a transaction so that every record is discarded if the CSV is invalid.
          CSV.parse(params[:csv_content]) do |row|
            @results << User.create!(Hash[user_keys.zip([SecureRandom.urlsafe_base64] + row)])
          end
        end
      rescue ActiveRecord::RecordInvalid => e
        @results = []
        flash[:error] = "Le fichier CSV est invalide. Erreur : #{e.message}."
      end
    end
  end

  def frontpage
  end

  def add_user
  end
end

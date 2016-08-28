class ProfilesController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action -> { check_ownership(@user) }, only: [:edit, :update, :destroy]

  def show
  end

  def edit
  end

  def index
    @users = User.all.order(:lastname)
  end

  def update
    if not user_params[:password].blank? and @user.update_with_password(user_params) or @user.update_without_password(user_params)
      flash[:success] = "Profil mis à jour."

      # Condition necessary so that admin is not signed in as edited user.
      sign_in @user, :bypass => true if current_user == @user
    else
      flash[:error] = "Une erreur est survenue lors de l'édition du profil : #{@user.errors.full_messages}"
    end
    render 'edit'
  end

  def destroy
    if @user.destroy
      flash[:success] = "Utilisateur supprimé."
    else
      flash[:error] = "Erreur lors de la suppression de l'utilisateur."
    end
    redirect_to action: 'index'
  end
  
  private

  def set_user
    @user = User.find_by(id: params[:id])
    unless @user
      flash[:error] = "Cet utilisateur n'existe pas."
      redirect_to action: 'index'
    end
  end

  def user_params
    params.require(:user).permit(:password, :password_confirmation, :job, :company, :linkedin, :twitter, :description)
  end
end

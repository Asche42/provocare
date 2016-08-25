class ProfilesController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
    if current_user and @user != current_user and not current_user.admin?
      flash[:error] = "Vous n'avez pas les droits nécessaires pour éditer ce profil."
      render 'show'
    end
  end

  def index
    @users = User.all.order(:lastname)
  end

  def update
    @user = User.find_by(id: params[:id])

    if current_user and (current_user == @user or current_user.admin?)
      if not user_params[:password].blank? and @user.update_with_password(user_params) or @user.update_without_password(user_params)
        flash[:success] = "Profil mis à jour."
        sign_in @user, :bypass => true
      else
        flash[:error] = "Une erreur est survenue lors de l'édition du profil : #{@user.errors.full_messages}"
      end
      render 'edit'
    else
      flash[:error] = "Vous n'avez pas les droits suffisants pour poursuivre."
      render 'index'
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation, :job, :company, :linkedin, :twitter, :description)
  end
end

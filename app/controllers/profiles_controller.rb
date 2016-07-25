class ProfilesController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def index
    @users = User.all.order(:lastname)
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = 'Profil mis à jour.'
      render 'edit'
    else
      flash[:error] = 'Une erreur est survenue lors de l\'édition du profil.'
      render 'edit'
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation, :job, :company, :linkedin, :twitter, :description)
  end
end

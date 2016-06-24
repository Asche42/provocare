class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def check_ownership(owner)
    unless current_user and (owner == current_user or current_user.admin?)
      flash[:alert] = "Vous n'avez pas accès à cette page."
      redirect_to root_path
    end
  end
end

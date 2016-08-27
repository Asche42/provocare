class ErrorsController < ApplicationController
  # From https://wearestac.com/blog/dynamic-error-pages-in-rails

  def show
    render status_code.to_s, :status => status_code
  end

  protected

  # Fallback on error 500 if no error code present.
  def status_code
    params[:code] || 500
  end
end

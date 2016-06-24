class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action -> { check_ownership(@offer.user) }, only: [:edit, :create, :update, :destroy]

  respond_to :html

  def index
    @offers = Offer.all
    @admin = (current_user and current_user.admin?)
    
    respond_with(@offers)
  end

  def show
    respond_with(@offer)
  end

  def new
    @offer = Offer.new
    respond_with(@offer)
  end

  def edit
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user
    @offer.save
    respond_with(@offer)
  end

  def update
    @offer.update(offer_params)
    respond_with(@offer)
  end

  def destroy
    @offer.destroy
    respond_with(@offer)
  end

  private
    def set_offer
      @offer = Offer.find(params[:id])
    end

    def offer_params
      params.require(:offer).permit(:offer_type, :user_id, :company, :title, :content, :date_from, :date_to)
    end
end

class Offer < ActiveRecord::Base
  belongs_to :user

  before_validation(on: :create) do
    if offer_type >= 0 and offer_type <= 2
      self.offer_type = offer_type
    else
      false
    end
  end

  def internship?
    (offer_type == 0)
  end

  def job?
    (offer_type == 1)
  end

  def pit?
    (offer_type == 2)
  end
end

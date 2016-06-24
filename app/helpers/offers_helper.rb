module OffersHelper
  def offer_type(offer_type)
    case offer_type
    when 0
      "stage"
    when 1
      "emploi"
    when 2
      "PIT"
    end
  end
end

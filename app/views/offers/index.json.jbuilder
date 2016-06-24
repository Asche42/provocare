json.array!(@offers) do |offer|
  json.extract! offer, :id, :type, :user_id, :company_id, :titre, :content, :date_from, :date_to, :created_on, :updated_on
  json.url offer_url(offer, format: :json)
end

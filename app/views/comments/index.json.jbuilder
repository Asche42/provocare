json.array!(@comments) do |comment|
  json.extract! comment, :id, :article_id_id, :user_id_id, :content, :created_on, :updated_on
  json.url comment_url(comment, format: :json)
end

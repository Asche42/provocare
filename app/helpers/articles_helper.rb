module ArticlesHelper
  def can_edit?(article)
    current_user == article.user or current_user.admin?
  end
end

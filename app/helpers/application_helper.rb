module ApplicationHelper
  def can_edit_item?(item)
    current_user and (current_user == item.user or current_user.admin?)
  end
end

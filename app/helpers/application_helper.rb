module ApplicationHelper
  def render_user_avatar(user, size)
    if user.avatar.present?
      user.avatar
    else
      avatar
end

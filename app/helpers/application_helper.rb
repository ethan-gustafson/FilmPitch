module ApplicationHelper

  def current_user_project?
    current_user.id == @project.user_id
  end

  def current_user_comment?
    current_user.id == comment.user_id
  end

end

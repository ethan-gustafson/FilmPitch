module ApplicationHelper

  def current_user_project?
    current_user.id == @project.user_id
  end

end

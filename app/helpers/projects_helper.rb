module ProjectsHelper

  def find_project_by_id
    @project = Project.find_by_id(params[:id])
    redirect_to projects_path if @project.nil?
  end

  def current_user_project?
    current_user.id.equal?(@project.user_id)
  end

  def show_comments?
    @comments = @project.comments.includes(:user).last(10).reverse if !@project.nil?
  end
end

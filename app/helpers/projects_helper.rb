module ProjectsHelper

  def find_project_by_id
    @project = Project.find_by_id(params[:id])
     
    redirect_to projects_path if @project.nil?
  end

  def show_comments?
    # If the project exits == If the project isn't nil
    if !@project.nil?
      # Eager load the project comments, including the user data
      @comments = @project.comments.includes(:user).last(10).reverse
    end
  end
  
end

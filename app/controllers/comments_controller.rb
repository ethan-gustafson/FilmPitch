class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)

    if comment.valid?
      comment.save
      redirect_to project_path(comment.project)
    else
      redirect_to project_path(comment.project)
    end
  end
  
  def update
    comment = Comment.find_by_id(params[:comment_id])
    
    if current_user_comment?
      if comment.update(comment_params)
        comment.save
        redirect_to project_path(comment.project)
      end
    else
      redirect_to project_path(comment.project)
    end
  end

  def destroy
    comment = Comment.find_by_id(params[:comment_id])
    project = comment.project
    
    if current_user_comment?
      comment.destroy
      redirect_to project_path(project)
    else
      redirect_to project_path(project)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(
      :description,
      :user_id,
      :project_id
    )
  end
end

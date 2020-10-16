class CommentsController < ApplicationController
  def create
    comment = comment.new(comment_params)

    if comment.valid?
      comment.save
      redirect_to post_path(comment.post)
    else
      redirect_to post_path(comment.post)
    end
  end
  
  def update
    @comment = Comment.find_by_id(params[:comment_id])
    
    if current_user_comment?
      if @comment.update(comment_params)
        @comment.save
        redirect_to post_path(@comment.post)
      end
    else
      redirect_to post_path(@comment.post)
    end
  end

  def destroy
    @comment = Comment.find_by_id(params[:comment_id])
    project = @comment.project
    
    if current_user_comment?
      @comment.destroy
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

class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)

    if @comment.valid?

      @comment.save
      # You have to use methods found in ActiveJob::Core::ClassMethods -> 
      # https://edgeapi.rubyonrails.org/classes/ActiveJob/Core/ClassMethods.html

      # To enqueue a job to be performed as soon as the queuing system is free, use:
      # .perform_later(record)

      @obj = {
        id: @comment.id,
        description: @comment.description,
        user_id: @comment.user_id,
        project_id: @comment.project_id,
        display_name: @comment.user.display_name
      }.as_json

      CommentBroadcastJob.perform_later(
        @comment.project, 
        render_to_string(
          partial: 'comments/comment',
          locals: {
            comment: @obj
          } 
        )
      )

    else
      redirect_to project_path(comment.project)
    end
  end
  
  def update
    comment = Comment.find_by_id(params[:id])
    
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
    @comment = Comment.find_by_id(params[:id])
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

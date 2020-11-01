class CommentsController < ApplicationController
  
  def create
    comment = Comment.new(comment_params)

    if comment.valid?

      comment.save
      # You have to use methods found in ActiveJob::Core::ClassMethods -> 
      # https://edgeapi.rubyonrails.org/classes/ActiveJob/Core/ClassMethods.html

      # To enqueue a job to be performed as soon as the queuing system is free, use:
      # .perform_later(record)
      comment_values = comment.as_json
      comment_values["display_name"] = comment.user.display_name
      comment_values["action"] = "create"

      CommentBroadcastJob.perform_later(
        comment.project, 
        comment_values
      )
    else
      CommentBroadcastJob.perform_later(
        comment.project, {
          action: "error",
          error_message: "There was an issue posting the comment"
        }
      )
    end
  end
  
  def update
    @comment = Comment.find_by_id(params[:id])
    
    if current_user_comment? && @comment.update(comment_params)

      comment_values = @comment.as_json
      comment_values["display_name"] = @comment.user.display_name
      comment_values["action"] = "update"

      CommentBroadcastJob.perform_later(
        @comment.project, 
        comment_values
      )
    else
      CommentBroadcastJob.perform_later(
        @comment.project, {
          comment_id: @comment.id,
          action: "error",
          error_message: "There was an issue updating the comment"
        }
      )
    end
  end

  def destroy
    @comment = Comment.find_by_id(params[:id])
    project = @comment.project
    
    if current_user_comment?
      @comment.destroy
      CommentBroadcastJob.perform_later(
        project, {
          id: params[:id],
          action: "destroy"
        }
      )
    else
      CommentBroadcastJob.perform_later(
        project, {
          id: params[:id],
          action: "error",
          error_message: "There was an issue deleting the comment"
        }
      )
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:description, :user_id, :project_id)
  end
end

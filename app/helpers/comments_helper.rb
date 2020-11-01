module CommentsHelper

  def comment_values(action)
    comment_hash = @comment.as_json
    comment_hash["display_name"] = @comment.user.display_name
    comment_hash["action"] = action
    comment_hash
  end
end

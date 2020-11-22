module CommentsHelper
  def current_user_comment?
    current_user.id.equal?(@comment.user_id)
  end
end

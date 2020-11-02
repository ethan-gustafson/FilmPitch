module ApplicationHelper

  def current_user_project?
    current_user.id == @project.user_id
  end

  def current_user_comment?
    current_user.id == @comment.user_id
  end

  def add_to_hash(hash = {}, **values)
    if hash.class.eql?(Hash)
      values.each do |k,v| 
        hash.store(k.to_s, v)
      end
      return hash
    else
      begin
        raise ArgumentError, "Expected Hash Argument, instead received #{hash.class}"
      rescue ArgumentError => exception
        puts "\n#{exception.class} (#{exception.message})\n"
      end
    end
  end

end

# Active Job is a framework for declaring jobs and making them run on a variety of 
# queuing backends. These jobs can be everything from regularly scheduled clean-ups, 
# to billing charges, to mailings. Anything that can be chopped up into small units 
# of work and run in parallel, really.

class CommentBroadcastJob < ApplicationJob
  queue_as :default

  # Broadcast a hash to a unique broadcasting for this <tt>model</tt> in this channel.

    # def broadcast_to(model, message)
    #   ActionCable.server.broadcast(broadcasting_for(model), message)
    # end

  # Active Job objects can be defined by creating a class that inherits from the 
  # ActiveJob::Base class. The only necessary method to implement is the “perform” method.
  

  def perform(project, data)
    CommentsChannel.broadcast_to(project, data)
  end
end

# Returns a unique broadcasting identifier for this <tt>model</tt> in this channel:

#  CommentsChannel.broadcasting_for("all") # => "comments:all"

# You can pass any object as a target (e.g. Active Record model), and it
# would be serialized into a string under the hood.

  # def broadcasting_for(model)
  #   serialize_broadcasting([ channel_name, model ])
  # end

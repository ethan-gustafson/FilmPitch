# Generated with `rails g channel Comments`
class CommentsChannel < ApplicationCable::Channel
  # #subscribed is called when the consumer has successfully
  #   become a subscriber to this channel.
  #
  # Streams provide the mechanism by which channels route published content (broadcasts) 
  #   to their subscribers.
  # 
  # `stream_for` -> Start streaming the pubsub queue for the <tt>model</tt> in this 
  #   channel. Optionally, you can pass a <tt>callback</tt> that'll be used instead of 
  #   the default of just transmitting the updates straight to the subscriber.
  #
  # Pass <tt>coder: ActiveSupport::JSON</tt> to decode messages as JSON before passing 
  #   to the callback. Defaults to <tt>coder: nil</tt> which does no decoding, passes 
  #   raw messages.
  #
  # def stream_for(model, callback = nil, coder: nil, &block)
  #   stream_from(broadcasting_for(model), callback || block, coder: coder)
  # end
  #
  # In Rails 6.1, a new method for handling the below control structure is defined as
  #   stream_or_reject_for(record), which houses this code:
  #
  # if project
  #   stream_for project
  # else
  #   reject
  # end
  #
  # If there is a record, subscribe the user and start a stream, else reject
  #   the user and don't start a new stream.
  def subscribed
    project = Project.find_by_id(params[:id])
    if project
      stream_for project
    else
      reject
    end
  end

  # `receive(data)` is where we can rebroadcast a message sent by one client to 
  #   any other connected clients ~> ActionCable.server.broadcast(project, data)

  def receive(data)
    # Rebroadcast
  end

  # #unsubscribed is where any cleanup is set when channel is unsubscribed ~>
  #   stop_all_streams -> Unsubscribes all streams associated with this channel 
  #   from the pubsub queue

  def unsubscribed
    stop_all_streams
  end
end
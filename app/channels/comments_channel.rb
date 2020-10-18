# Generated with `rails g channel Comments`

class CommentsChannel < ApplicationCable::Channel

  # #subscribed is called when the consumer has successfully
  # become a subscriber to this channel.
  def subscribed
    # project = Project.find(params[:id])
    # stream_for project
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
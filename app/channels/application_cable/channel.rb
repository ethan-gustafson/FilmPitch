# A channel encapsulates a logical unit of work, similar to what a controller 
# does in a regular MVC setup. 

# By default, Rails creates a parent ApplicationCable::Channel class for encapsulating
# shared logic between your channels.

# This channel is the parent channel.

module ApplicationCable
  class Channel < ActionCable::Channel::Base
  end
end

# You would create your own channel classes in other files.
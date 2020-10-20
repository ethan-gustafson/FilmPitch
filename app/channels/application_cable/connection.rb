# Connections form the foundation of the client-server relationship. 

# For every WebSocket accepted by the server, a connection object is instantiated. 
# This object becomes the parent of all the channel subscriptions that are created 
# from there on. 

# The connection itself does not deal with any specific application 
# logic beyond authentication and authorization. The client of a WebSocket connection 
# is called the connection consumer. An individual user will create one 
# consumer-connection pair per browser tab, window, or device they have open.

# Connections are instances of ApplicationCable::Connection. In this class, 
# you authorize the incoming connection, and proceed to establish it if the user 
# can be identified.

# Essentially, logged in users connect to the action cable server. They don't become a 
# subscriber yet, though. The channel #subscribed method will handle that portion. This
# class is all about authenticating and authorizing the user for this specific connection, 
# allowing Action Cable to find the connection later.

module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user
 
    def connect
      self.current_user = find_verified_user
    end

    def disconnect
      # Any cleanup work needed when the cable connection is cut.
      # close(reason: nil, reconnect: true)
    end
 
    private
      def find_verified_user
        if verified_user = env['warden'].user
          verified_user
        else
          # You can find the reject_unauthorized_connection method here -> https://github.com/rails/rails/blob/master/actioncable/lib/action_cable/connection/authorization.rb
          reject_unauthorized_connection
        end
      end
  end
end

# Here identified_by is a connection identifier that can be used to find the specific 
# connection later. Note that anything marked as an identifier will automatically 
# create a delegate by the same name on any channel instances created off the connection.

# The above relies on the fact that I already handled authentication of the user 
# using Devise, and that a successful authentication set a signed cookie with the user ID.

# The cookie is then automatically sent to the connection instance when a new connection 
# is attempted, and you use that to set the current_user. By identifying the connection 
# by this same current user, you're also ensuring that you can later retrieve all open 
# connections by a given user (and potentially disconnect them all if the user is- 
# deleted or unauthorized).

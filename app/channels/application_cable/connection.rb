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

module ApplicationCable
  class Connection < ActionCable::Connection::Base
  #   identified_by :current_user
 
  #   def connect
  #     self.current_user = find_verified_user
  #   end

  #   def disconnect
  #     # Any cleanup work needed when the cable connection is cut.
  #   end
 
  #   private
  #     def find_verified_user
  #       if verified_user = User.find_by(id: cookies.encrypted[:user_id])
  #         verified_user
  #       else
  #         reject_unauthorized_connection
  #       end
  #     end
  # end
end

# Here identified_by is a connection identifier that can be used to find the specific 
# connection later. Note that anything marked as an identifier will automatically 
# create a delegate by the same name on any channel instances created off the connection.

# This example relies on the fact that you will already have handled authentication
# of the user somewhere else in your application, and that a successful authentication
# sets a signed cookie with the user ID.

# The cookie is then automatically sent to the connection instance when a new connection 
# is attempted, and you use that to set the current_user. By identifying the connection 
# by this same current user, you're also ensuring that you can later retrieve all open 
# connections by a given user (and potentially disconnect them all if the user is- 
# deleted or unauthorized).

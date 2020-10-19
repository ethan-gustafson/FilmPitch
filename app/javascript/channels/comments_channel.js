// https://github.com/rails/rails/blob/master/actioncable/app/javascript/action_cable/subscriptions.js
// https://github.com/rails/rails/blob/master/actioncable/app/javascript/action_cable/subscription.js

import consumer from "./consumer";

// Generated with `rails g channel Comments`

consumer.subscriptions.create("CommentsChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
  }
});

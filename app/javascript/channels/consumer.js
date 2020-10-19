// Action Cable provides the framework to deal with WebSockets in Rails.
// You can generate new channels where WebSocket features live using the `rails generate channel` command.

// https://github.com/rails/rails/blob/master/actioncable/app/javascript/action_cable/consumer.js

import { createConsumer } from "@rails/actioncable";

export default createConsumer();

// This will ready a consumer that'll connect against /cable on your server by default.
// The connection won't be established until you've also specified at least one subscription you're interested in having.

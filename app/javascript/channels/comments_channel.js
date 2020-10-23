// https://github.com/rails/rails/blob/master/actioncable/app/javascript/action_cable/subscriptions.js
// https://github.com/rails/rails/blob/master/actioncable/app/javascript/action_cable/subscription.js

import consumer from "./consumer";

// Generated with `rails g channel Comments`

var url = window.location.href;
let id = url.slice(url.length - 1, url.length);

consumer.subscriptions.create({channel: "CommentsChannel", id: id}, {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("Connected to the comments channel!");
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    // console.log("Recieving...")
    console.log(data);

    // console.log("Appending...")
    this.appendComment(data);
    // console.log("I have appended!")
  },

  appendComment(data){
    const commentSection = document.getElementById("comments");

    const currentUserElement = document.getElementById("current_user").href;
    const currentUserId = parseInt(currentUserElement.split('/users/')[1]);

    console.log(`this is you: ${currentUserId}`);
    console.log(`this is the data sent in: ${data.user_id}`)

    var div = document.createElement("div");

    if (currentUserId === data.user_id){
      div.innerHTML = `
        <div>
          <h4>${data.display_name}</h4>
          <p>${data.description}</p>
        </div>

        <div>
          <button>Edit</button>
          <p>
            <a data-confirm="Are you sure?" 
              rel="nofollow" 
              data-method="delete" 
              href="/comments/${data.id}"
            >
              delete
            </a>
          </p>
        </div>
      `
    } else {
      div.innerHTML = `
        <div>
          <h4>${data.display_name}</h4>
          <p>${data.description}</p>
        </div>
      `
    }

    commentSection.insertAdjacentHTML("afterbegin", div.innerHTML);
  }
})

// The notation above is the Methods Properties addition in ES6/ECMAScript 2015.
// -> https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/Method_definitions
// -> http://es6-features.org/#MethodProperties 

// The function name is the key and the expression is the value.

/* 

  obj = {
      foo (a, b) {
          …
      },
      bar (x, y) {
          …
      },
      *quux (x, y) {
          …
      }
  }

  In ES5, it was written as:

  obj = {
    foo: function (a, b) {
        …
    },
    bar: function (x, y) {
        …
    },
    //  quux: no equivalent in ES5
    …
  };

  ---

  The asterisk (*) in the shorthand syntax must be before the generator property name:

  *quux (x, y) {
          …
      }

  ---

  The function* declaration (function keyword followed by an asterisk) defines
  a generator function, which returns a Generator object -> https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/function*

  The Generator object is returned by a generator function and it conforms to both 
  the iterable protocol and the iterator protocol. This object cannot be instantiated 
  directly. Instead, a Generator instance can be returned from a generator function.

*/

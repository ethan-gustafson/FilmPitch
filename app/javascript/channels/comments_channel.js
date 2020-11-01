// https://github.com/rails/rails/blob/master/actioncable/app/javascript/action_cable/subscriptions.js
// https://github.com/rails/rails/blob/master/actioncable/app/javascript/action_cable/subscription.js

// Generated with `rails g channel Comments`

import consumer from "./consumer";

// Capture the project id by getting the url and splitting it between the route and number
let id = window.location.href.split('/projects/')[1];

// id will be sent to comments_channel.rb#subscribed as params[:id]
consumer.subscriptions.create({channel: "CommentsChannel", id: id}, {
  connected() {
    // Called when the subscription is ready for use on the server
    var count = 9;
    const projectsNav = document.querySelector("#projects-nav");
    // connectedMessage appears as the first child element of the project nav links header
    const connectedMessage = document.createElement("p");
    
    connectedMessage.id = "welcome-message";
    connectedMessage.innerHTML = `Welcome to this project's stream! Comments will display in real time. Removing in ${count}...`;

    // The insertAdjacentElement() method of the Element interface inserts a given element node at a given position relative to the element it is invoked upon
    projectsNav.insertAdjacentElement("afterend", connectedMessage);

    var countDown = setInterval(() => {
      connectedMessage.innerHTML = `Welcome to this project's stream! Comments will display in real time. Removing in ${count}...`;

      count === 0 ? clearInterval(countDown) : count--;
    }, 1000);

    setTimeout(() => {
      connectedMessage.remove();
    }, 10000);
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
    console.log("disconnected from comments_channel");
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel

    switch (data.action) {
      case "create":
        let containerDiv = document.createElement("div");
        containerDiv.id = `comment_${data.id}`;

        this.createComment(containerDiv, data);
        break;
      case "update":
        this.updateComment(data);
        break;
      case "destroy":
        this.deleteComment(data.id);
        break;
      case "error":
        this.handleError(data);
        break;
      default:
        console.log("No match found");
    }
  },

  appendComment(element, action){
    // commentSection is the parent element of all comment elements
    const commentSection = document.getElementById("comments");
    
    switch (action) {
      case "create":
        commentSection.insertAdjacentElement("afterbegin", element);
        break;
      case "update":
        console.log("Comment updated");
        break;
      default:
        console.log("No match found");
    }
  },

  createComment(element, data){
    // The current user id is found from the top right profile picture anchor tag
    const currentUserId = parseInt(document.getElementById("current_user").href.split('/users/')[1]);

    // The csrf authenticity token is grabbed from a meta tag in the head element
    const csrfAuthenticityToken = document.getElementsByName('csrf-token')[0].content;

    if (currentUserId === data.user_id){
      element.innerHTML = `
        <div>
          <h4>${data.display_name}</h4>
          <span>Created: ${data.created_at} - Updated: ${data.updated_at}</span>

          <form action="/comments/${data.id}" accept-charset="UTF-8" method="post">
            <input type="hidden" name="authenticity_token" value="${csrfAuthenticityToken}">
            <input type="hidden" name="_method" value="put">
            <input type="hidden" name="comment[user_id]" value="${data.user_id}">
            <input type="hidden" name="comment[project_id]" value="${data.project_id}">
            
            <textarea class="comment_description" name="comment[description]">${data.description}</textarea>

            <div class="edit-delete">
              <input type="submit" value="Update">

              <span>
                <a rel="nofollow" data-method="delete" href="/comments/${data.id}">Delete</a>
              </span>
            </div>
          </form>
        </div>
      `;
    } else {
      element.innerHTML = `
        <div>
          <h4>${data.display_name}</h4>
          <div class="comment-description">
            <span>Posted: ${data.updated_at}</span>
            <p>${data.description}</p>
          </div>
        </div>
      `;
    };
    this.appendComment(element, data.action)
  },

  // updateComment works by selecting the correct comment, and calling createComment with
  // the passed in values. createComment will just change the innerHTML of that element.

  updateComment(data){
    const commentElementDiv = document.querySelector(`#comment_${data.id}`);
    this.createComment(commentElementDiv, data, data.action);
  },
  
  deleteComment(id){
    const grabCommentElementDiv = document.querySelector(`#comment_${id}`);
    grabCommentElementDiv.remove();
  },

  handleError(data){
    alert(data.error_message);
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

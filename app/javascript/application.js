// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "semantic-ui"
import "semantic-ui-css/components/transition.js"; // Ensure the transition module is imported
import "channels"

$(function() {
    $('.ui.dropdown').dropdown();
});

$(document).on('turbo:load', function() {
    $('.ui.dropdown').dropdown();
    $('.ui.modal').modal();

    // submit_message();

    // Scroll to the bottom of the messages container
    scroll_bottom();
});

// submit_message = function() {
//     // Get the message input field
//     const messageInput = document.getElementById("message_body");
//     // Get the message container
//     const messagesContainer = document.getElementById("messages");
//     // Check if the message input is not empty
//     if (messageInput.value.trim() !== "") {
//         // Create a new message element
//         const newMessage = document.createElement("div");
//         newMessage.className = "message";
//         newMessage.innerHTML = `<p>${messageInput.value}</p>`;
//         // Append the new message to the messages container
//         messagesContainer.appendChild(newMessage);
//         // Clear the message input field
//         messageInput.value = "";
//         // Scroll to the bottom of the messages container
//         scroll_bottom();
//     }

//     $('#message_body').on('keypress', function(event) {
//         if (event.key === 'Enter' || event.keyCode === 13) {
//             event.target.form.submit(); // Submit the form
//             event.target.value = ""; // Clear the input field
//         }
//     }
//     );
// }

const scroll_bottom = function() {
    if ($('#messages').length > 0) {
        $('#messages').scrollTop($('#messages')[0].scrollHeight);
    }
}


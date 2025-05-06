import consumer from "channels/consumer"

consumer.subscriptions.create("ChatroomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("Connected to the ChatroomChannel");
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
    console.log("Disconnected from the ChatroomChannel");
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    // Append the new message to the chatbox
    // alert(data.foo);
    const messagesContainer = document.getElementById("message-container");
    messagesContainer.insertAdjacentHTML("beforeend", data.message);
  }
});

// app/javascript/controllers/scroll_controller.js

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.scrollToBottom();
    this.clearInput();
  }

  scrollToBottom() {
    // Scrolls the container to the bottom
    const messagesContainer = document.getElementById('messages-container');
    messagesContainer.scrollTop = messagesContainer.scrollHeight;
  }

  clearInput() {
    document.addEventListener("turbo:before-stream-render", event => {
      document.getElementById('message_body').value = '';
    });
  }
}
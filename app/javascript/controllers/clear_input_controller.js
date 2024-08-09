// app/javascript/controllers/clear_input_controller.js

import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.clearInput();
  }

  clearInput() {
    document.addEventListener("turbo:before-stream-render", event => {
      const messageBody = document.getElementById('message_body');
      if (messageBody) {
        messageBody.value = '';
      }
    });
  }
}

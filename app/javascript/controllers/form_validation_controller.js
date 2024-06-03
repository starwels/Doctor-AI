// app/javascript/controllers/form_validation_controller.js

import {Controller} from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    const form = this.element;

    form.addEventListener("submit", event => {
      if (!form.checkValidity()) {
        event.preventDefault();
        event.stopPropagation();
        form.scrollIntoView({behavior: "smooth", block: "start"});
      }

      form.classList.add("was-validated");
    });

    form.querySelectorAll("input, select, textarea").forEach(input => {
      input.addEventListener("blur", () => {
        if (!input.checkValidity()) {
          input.classList.add("is-invalid");
        } else {
          input.classList.remove("is-invalid");
          input.classList.add("is-valid");
        }
      });
    });
  }
}

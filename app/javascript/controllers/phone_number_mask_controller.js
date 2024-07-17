import { Controller } from "@hotwired/stimulus"
import Inputmask from "inputmask";

// Connects to data-controller="phone-number-mask"
export default class extends Controller {
  connect() {
    Inputmask({ mask: "(99) 9999-9999" }).mask(this.element);
  }
}

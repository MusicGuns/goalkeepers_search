import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="controller"
export default class extends Controller {
  connect() {
    setTimeout(() => {
      this.element.remove();
    }, 20000);
  }
}

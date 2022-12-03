import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="controller"
export default class extends Controller {
  connect() {
    console.log(this.element)
    setTimeout(() => {
      this.element.remove();
    }, 20000);
  }
}

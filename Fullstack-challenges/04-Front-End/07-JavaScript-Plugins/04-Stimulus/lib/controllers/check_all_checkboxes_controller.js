import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["checkbox"]

  connect() {}

  checkAll(event) {
    if (event.target.checked === true) {
      this.checkboxTargets.forEach((element) => {
        element.checked = true;
      });
    } else {
      this.checkboxTargets.forEach((element) => {
        element.checked = false;
      });
    }
  }
}

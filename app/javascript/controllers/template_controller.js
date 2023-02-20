import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="template"
export default class extends Controller {
  static targets = [ "textarea", "template" ]

  insert() {
    var template = this.templateTarget.value
    this.textareaTarget.insertAdjacentHTML("beforeend", template)
  }
}

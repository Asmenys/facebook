import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = [ "dropdown" ]

  toggle() {
    if(this.dropdownTarget.hidden == true)
      this.updateTargetVisibility(this.dropdownTarget, false)
    else
      this.updateTargetVisibility(this.dropdownTarget, true)
  }
  updateTargetVisibility(target, visibility_status){
    target.hidden = visibility_status
  }
}

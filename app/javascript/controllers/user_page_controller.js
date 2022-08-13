import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["userPageBody"]
    updateUserPageBody(event){
        let new_frame = document.createElement("turbo-frame")
        new_frame.id = event.params.frameName
        this.userPageBodyTarget.replaceChild(new_frame, this.userPageBodyTarget.firstChild)
    }
}
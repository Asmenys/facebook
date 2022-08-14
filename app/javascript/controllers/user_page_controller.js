import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    
    static targets = ["userPageBody", "userPageBodyContent"]

    replaceUserPageBody(event){
        let new_frame = document.createElement("turbo-frame")
        new_frame.id = event.params.frameName
        new_frame.setAttribute("data-user-page-target", "userPageBodyContent")
        this.userPageBodyTarget.replaceChild(new_frame, this.userPageBodyContentTarget)
    }

}
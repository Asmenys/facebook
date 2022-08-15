import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    
    static targets = ["userPageBody", "posts", "about", "friends", "friend_requests"]
    static values = { currentDisplayPage: String}

    initialize(){
        this.currentDisplayPageValue = "posts"
    }
    replaceUserPageBody(event){
        this.getTarget(this.currentDisplayPageValue).hidden= true
        this.currentDisplayPageValue = event.params.frameName
        this.getTarget(this.currentDisplayPageValue).hidden= false
    }
    getTarget(targetName){
        return targetName == "posts" ? this.postsTarget
                : targetName == "about" ? this.aboutTarget
                : targetName == "friends" ? this.friendsTarget
                : targetName == "friend_requests" ? this.friend_requestsTarget
                : null
    }

}
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    
    static targets = ["userPageBody", "posts", "about", "friends", "friend_requests"]
    static values = { currentDisplayPage: String}

    initialize(){
        this.currentDisplayPageValue = "posts"
    }
    replaceUserPageBody(event){
        this.hideCurrentTarget()
        this.unhideNewTarget(event.params.frameName)
    }
    hideCurrentTarget(){
        this.getTarget(this.currentDisplayPageValue).hidden = true
        this.resetStyle(this.currentDisplayPageValue)
    }
    unhideNewTarget(frameName){
        this.setSelectedStyle(frameName)
        this.currentDisplayPageValue = frameName
        this.getTarget(this.currentDisplayPageValue).hidden = false
    }

    getTarget(targetName){
        return targetName == "posts" ? this.postsTarget
                : targetName == "about" ? this.aboutTarget
                : targetName == "friends" ? this.friendsTarget
                : targetName == "friend_requests" ? this.friend_requestsTarget
                : null
    }

    resetStyle(targetId){
        document.getElementById(targetId).className = "m-2 p-2 select-none cursor-pointer hover:bg-gray-200"
    }

    setSelectedStyle(targetId){
        let target = document.getElementById(targetId)
        target.className = "m-2 p-2 select-none cursor-pointer hover:bg-gray-200 border-b-2 border-solid border-blue-500 text-blue-500"
    }

}
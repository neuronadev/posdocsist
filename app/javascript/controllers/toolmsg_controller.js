import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toolmsg"
export default class extends Controller {

  connect() {
     var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
     var popoverList = popoverTriggerList.map(function (popoverTriggerEl){
           return new bootstrap.Popover(popoverTriggerEl)
     })

  }

}

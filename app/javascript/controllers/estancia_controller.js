import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="estancia"
export default class extends Controller {
  connect() {
  }

  nuevo(event){
      let frm = document.getElementById("pages_item")
      frm.src = "estancias/new"
      frm.reload()
  }
}

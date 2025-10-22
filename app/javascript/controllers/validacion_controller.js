import { Controller } from "@hotwired/stimulus"
var token = document.querySelector('meta[name="csrf-token"]').content
// Connects to data-controller="validacion"
export default class extends Controller {
  connect() {
  }

  cambio(event){
      let frm = document.getElementById("proc_solicitud")
      frm.src = `solicitudes/new?idest=${event.params.idest}&tipo=C`
      frm.reload()
  }

  soldocumentos(event){
      let frm = document.getElementById("proc_solicitud")
      frm.src = `solicitudes/new?idest=${event.params.idest}&tipo=P`
      frm.reload()
   }

  cancelar(event){
      let frm = document.getElementById("proc_solicitud")
      let div_sol = document.getElementById("solcambio")

      frm.src = ''
      frm.reload()

      div_sol.innerHTML = ""
  }
  
  async validar(event){
    try{
        let confirmar = confirm("La estancia registrada será validada, ¿desea continuar?"); 
        if (confirmar ){
          await fetch('/validaciones/validar',{
                      method: 'POST',
                      headers: {'Content-Type':'application/json', 'Accept':'application/json', 'X-CSRF-Token': token },
                      body: JSON.stringify( {id: event.params.idest} )
                  })
                  .then(response=>response.json())
                  .then(json=>{
                          let frm = document.getElementById("pages_item")
                          frm.src = frm.src
                          frm.reload()
                  })
        }          
          
      }catch(e){alert(e)}  
  }

}

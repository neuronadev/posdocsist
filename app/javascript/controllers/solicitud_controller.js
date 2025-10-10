import { Controller } from "@hotwired/stimulus"
var token = document.querySelector('meta[name="csrf-token"]').content
// Connects to data-controller="solicitud"
export default class extends Controller {
  connect() {
  }

  async atendida(event){
     try{
        let confirmar = confirm("La solicitud será marcada como atendida, ¿desea continuar?"); 
        if (confirmar ){
          await fetch('/solicitudes/atendida',{
                      method: 'POST',
                      headers: {'Content-Type':'application/json', 'Accept':'application/json', 'X-CSRF-Token': token },
                      body: JSON.stringify( {id: event.params.idsol} )
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

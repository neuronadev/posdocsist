class ValidacionesController < ApplicationController

  def index
      @estancias = Estancia.all
  end

   def validar
      estancia_id = params[:id]
    
      estancia = Estancia.find(estancia_id)
      estancia.estado = 'V'
      estancia.save

      item = {estancia: estancia}

      respond_to do |format|
          format.json { render json:estancia.to_json }
      end 
  end

end

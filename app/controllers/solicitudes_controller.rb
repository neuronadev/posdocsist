class SolicitudesController < ApplicationController
  def index
  end

  def show
        @solicitud = Solicitud.find(params[:id])
  end

  def new
      @idest = params[:idest]
      @solicitud = Solicitud.new
  end

  def create
       @solicitud = Solicitud.new(solicitud_params)
             
      respond_to do |format|
         if @solicitud.save
            estancia = Estancia.find(params[:solicitud][:estancia_id])
            estancia.estado = 'C'
            estancia.save
            format.html { redirect_to @solicitud }
         else
            format.html { render :new, status: :bad_request }
         end
       end
  end

  def atendida
      sol_id = params[:id]
    
      solicitud = Solicitud.find(sol_id)
      solicitud.estado = 'C'
      solicitud.save
      item = {solicitud: solicitud}

      respond_to do |format|
          format.json { render json:solicitud.to_json }
      end 
  end

   private
    def solicitud_params
        params.require(:solicitud).permit(
          :estancia_id,
          :validador,
          :estado,
          :comentario
        )
    end

end

class FinalizadosController < ApplicationController
  def show
      @estancia = Estancia.find(params[:est_id])
      
  end 
  def new
      @estancia = Estancia.find(params[:est_id])
      @tipo = params[:tipo]
      @finalizado = Finalizado.new
  end

  def create
      @finalizado = Finalizado.new(finalizado_params) 
      respond_to do |format|
          if @finalizado.save
              estancia = Estancia.find(@finalizado.estancia.id) 
              estancia.estado = params[:tipo]
              estancia.save

              flash[:success] = 'Estancia finalizada correctamente.'
              format.html { redirect_to estancia_path(@finalizado.estancia.id) } 
          else
              flash[:error] = 'Falta información, favor de revisar los campos marcados en rojo.'
              #@estan_nueva = Tipoestancia.where(clave:'NV').first.id
              format.html { render :new, status: :bad_request }
          end
      end
  end

  private
    def finalizado_params
        params.require(:finalizado).permit(:estancia_id, :reporte, :txtfinal)
    end

end

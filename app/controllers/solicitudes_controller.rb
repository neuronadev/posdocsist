class SolicitudesController < ApplicationController
  
  def index
  end

  def show
        @solicitud = Solicitud.find(params[:id])
  end

  def new
      @idest = params[:idest]
      @tipo = params[:tipo]
      @solicitud = Solicitud.new

      responsable = Persona.find(Estancia.find(@idest).responsable)

      @txt_msg = "
       <strong>Estimada Persona Investigadora #{responsable.nombre } #{responsable.apaterno } #{responsable.amaterno }:</strong>
       <br><br>
       Le informamos que, después de haber revisado su Convenio de Confidencialidad y demás documentos, se encontró que todo está correcto.
       <br><br>
       Por lo anterior, le solicitamos que, por favor, imprima el Convenio de Confidencialidad en dos tantos, los rubrique al margen derecho de cada hoja y los firmen al calce, en el espacio correspondiente a cada una de las partes (Persona Investigadora INECOL y Persona Investigadora Posdoctorante).
       <br><br>
       Posteriormente, deberá recabar la firma del Director General del INECOL. Uno de los ejemplares deberá entregarse a la Secretaría Académica, mientras que el otro quedará bajo su resguardo. Asimismo, le pedimos escanear el documento firmado y subirlo al sistema para continuar con su proceso.
       <br><br>
       Adicionalmente, deberá descargar del siguiente enlace la <a href='https://inecol-my.sharepoint.com/:w:/g/personal/antonio_francisco_inecol_mx/EWEDqwB0Uo5Cu_MVsTKQk4sBgNmJAbq1v_aAR0ChpFxwIw?e=RzSySF'>Carta de Adhesión al Código de Ética y de Conducta del INECOL</a>, la cual deberá ser impresa y firmada por la Persona Investigadora Posdoctorante, y entregarse en original a la Secretaría Académica.
       <br><br>
       Atentamente<br>
       Secretaría Académica
    "
  end

  def create
      @solicitud = Solicitud.new(solicitud_params)
             
      respond_to do |format|
         if @solicitud.save
            estancia = Estancia.find(params[:solicitud][:estancia_id])
            estancia.estado = @solicitud.tipo
            estancia.save

            if @solicitud.tipo == 'C'
                sleep 2
                Util::Email.corregir( @solicitud.estancia.externo.persona_id,
                                      @solicitud.estancia.id, 
                                      @solicitud.comentario.id
                                    )
            end

            if @solicitud.tipo == 'P'
                sleep 2
                Util::Email.firmaconv(@solicitud.comentario.id)
            end

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
          :comentario,
          :tipo
        )
    end

end

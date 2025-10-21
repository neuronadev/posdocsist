class PersonasController < ApplicationController
  def create
       @persona = Persona.new(persona_params)
       @respinv = @persona.externo.estancias.first.responsable
       p_rp = Persona.find(@respinv)

       respond_to do |format|
          if @persona.save
              flash[:success] = 'Registro realizado correctamente.'
              format.html { redirect_to estancia_path(@persona.externo.estancias.first.id) }

              Util::Email.notificar("#{p_rp.nombre} #{p_rp.apaterno} #{p_rp.amaterno}", 
                                    "#{@persona.nombre} #{@persona.apaterno} #{@persona.amaterno}", 
                                    "Red de Manejo Biotecnológico de Recursos", 
                                    'NEW_VAL')
              sleep 3
              Util::Email.notificar("#{p_rp.nombre} #{p_rp.apaterno} #{p_rp.amaterno}", 
                                    "#{@persona.nombre} #{@persona.apaterno} #{@persona.amaterno}", 
                                    "Red de Manejo Biotecnológico de Recursos", 
                                    'NEW_RP')
          else
              flash[:error] = 'Falta información, favor de revisar los campos marcados en rojo.'

              @tipopersona = @persona.tipopersona_id
              @tipoestancia = @persona.externo.estancias.first.tipoestancia_id
              #@respinv = @persona.externo.estancias.first.responsable

              format.html { render new_estancia_path, status: :bad_request  }
          end
       end
  end

  def update
      @persona = Persona.find(params[:id])
      respond_to do |format|
          if @persona.update(persona_params)
              flash[:success] = 'Registro actualizado correctamente.'
              format.html { redirect_to estancia_path(@persona.externo.estancias.first.id) } 
          else
              flash[:error] = 'Falta información, favor de revisar los campos marcados en rojo.'
              puts '-------------------------------------------------Errors' 
              puts @persona.errors.full_messages
              @tipopersona = @persona.tipopersona_id
              @tipoestancia = @persona.externo.estancias.first.tipoestancia_id
              @respinv = @persona.externo.estancias.first.responsable
              format.html { render 'estancias/edit' }
              #format.html { render edit_estancia_path(@persona.externo.estancias.first.id), status: :bad_request, locals: {persona: @persona} }
          end
      end  
  end

  private
    def persona_params
        params.require(:persona).permit(
          :nombre,
          :apaterno,
          :amaterno,
          :tipopersona_id,
          :red_id, externo_attributes:[:id, :persona_id, :cvu, estancias_attributes:[:id, :titulo, :responsable, :finicio, :ftermino, :tematica, :notas, :modalidad_id, :tipoestancia_id, :estado, :convenio_c, :convenio_i, :proyecto_c]]
        )
    end

end

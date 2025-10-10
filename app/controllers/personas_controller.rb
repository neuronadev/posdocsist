class PersonasController < ApplicationController
  def create
       @persona = Persona.new(persona_params)
       respond_to do |format|
          if @persona.save
              flash[:success] = 'Registro realizado correctamente.'
              format.html { redirect_to estancia_path(@persona.externo.estancias.first.id) } 
          else
              flash[:error] = 'Falta información, favor de revisar los campos marcados en rojo.'
              #@estan_nueva = Tipoestancia.where(clave:'NV').first.id
              format.html { render :new, status: :bad_request }
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
              #@estan_nueva = Tipoestancia.where(clave:'NV').first.id
              format.html { render :edit, status: :bad_request }
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
          :red_id, externo_attributes:[:id, :persona_id, :cvu, estancias_attributes:[:id, :titulo, :responsable, :finicio, :ftermino, :tematica, :notas, :modalidad_id, :tipoestancia_id, :estado, :conveniofirm, :cartaacepta]]
        )
    end

end

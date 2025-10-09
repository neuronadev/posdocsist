class EstanciasController < ApplicationController
  def index
      @estancias = Estancia.where(responsable: current_usuario.acceso.persona.id ) 
      

  def show
      @estancia = Estancia.find(params[:id])
  end

  def new
      @persona = Persona.new
      @externo = @persona.build_externo
      @estancia = @externo.estancias.build 

      @tipopersona = Tipopersona.where(clave: 'IEX').first.id
      @tipoestancia = Tipoestancia.where(clave: 'N').first.id
      @respinv = current_usuario.acceso.persona.id
  end
  end

end

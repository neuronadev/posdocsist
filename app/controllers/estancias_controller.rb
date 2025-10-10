class EstanciasController < ApplicationController

  def index
      @estancias = Estancia.where(responsable: current_usuario.acceso.persona.id ) 
  end    

  def show
      @estancia = Estancia.find(params[:id])
  end

  def edit
      @estancia_p = Estancia.find(params[:id])
      @persona = Persona.find(@estancia_p.externo.persona.id)
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
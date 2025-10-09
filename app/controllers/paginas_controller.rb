class PaginasController < ApplicationController
  def index
       if current_usuario.acceso.nivel.clave == 'R'
           redirect_to estancias_path
       end
  end
end

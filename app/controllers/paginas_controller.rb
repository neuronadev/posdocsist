class PaginasController < ApplicationController
  def index
       if current_usuario.acceso.nivel.clave == 'R'
           redirect_to estancias_path
       end

       if current_usuario.acceso.nivel.clave == 'V'
           redirect_to validaciones_path
       end
  end
end

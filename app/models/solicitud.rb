class Solicitud < ApplicationRecord
  before_create :set_default_estado
  
  belongs_to :estancia
  
  has_rich_text :comentario

  private
    def set_default_estado
         self.estado = 'A'
    end

  
end

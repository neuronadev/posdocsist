class Finalizado < ApplicationRecord
  belongs_to :estancia

  has_one_attached :reporte
  has_rich_text :txtfinal
  
end

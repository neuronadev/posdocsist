class Estancia < ApplicationRecord
  before_create :set_default_estado


  belongs_to :modalidad
  belongs_to :tipoestancia

  has_one :externoestancia
  has_one :externo, through: :externoestancia
  has_many :solicitudes
  has_one :finalizado

  has_one_attached :conveniofirm
  has_one_attached :cartaacepta

  private
    def set_default_estado
         self.estado = 'R'
    end

end

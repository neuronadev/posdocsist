class Externo < ApplicationRecord
  belongs_to :persona

  has_many :externoestancias
  has_many :estancias, through: :externoestancias

  accepts_nested_attributes_for :estancias, allow_destroy: true, reject_if: :all_blank
  
  validates :cvu, presence: {message: "Se requiere el número de registro único del posdoctor."}
  validate :cvu_registrado, on: :new

  private
    def cvu_registrado
        errors.add(:cvu, "El CVU ya se encuentra registrado. Más información...") if !Externo.where(cvu: cvu).blank?
    end
end
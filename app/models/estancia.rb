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

  validates :titulo, presence: {message: "Ingrese el titulo del proyecto que el posdoctor va a relaizar."}
  validates :finicio, presence: {message: "Ingrese la fecha de incio del proyecto."}
  validates :ftermino, presence: {message: "Ingrese la fecha de termino del proyecto."}
  validates :tematica, presence: {message: "Ingrese la temática del proyecto."}
  validates :conveniofirm, presence: {message: "Se requiere el convenio en formato PDF."}
  validates :cartaacepta, presence: {message: "Se requiere la carta de aceptación en formato PDF."}
  
  validate :ftermino_menor_igual


  private
    def set_default_estado
         self.estado = 'R'
    end

    def ftermino_menor_igual
        if !finicio.blank? && 
           !ftermino.blank? && 
           ( Date.parse(ftermino.strftime("%Y-%m-%d")) < Date.parse(finicio.strftime("%Y-%m-%d")) || 
             Date.parse(ftermino.strftime("%Y-%m-%d")) == Date.parse(finicio.strftime("%Y-%m-%d")) 
           )
              errors.add(:ftermino, "La fecha de termino no puede ser menor o igual a la fecha de inicio.") 
        end    
    end

end

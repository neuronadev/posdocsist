class Estancia < ApplicationRecord
  before_create :set_default_estado


  belongs_to :modalidad
  belongs_to :tipoestancia

  has_one :externoestancia
  has_one :externo, through: :externoestancia
  has_many :solicitudes
  has_one :finalizado

  has_one_attached :convenio_c
  has_one_attached :convenio_i
  has_one_attached :proyecto_c


  validates :titulo, presence: {message: "Ingrese el titulo del proyecto que el posdoctor va a relaizar."}
  validates :finicio, presence: {message: "Ingrese la fecha de incio del proyecto."}
  validates :ftermino, presence: {message: "Ingrese la fecha de termino del proyecto."}
  validates :tematica, presence: {message: "Ingrese la temática del proyecto."}
  validates :convenio_c, presence: {message: "Se requiere el convenio expedido por la SECIHTI en formato PDF."}
  validates :convenio_i, presence: {message: "Se requiere el convenio de confidencialdiad en formato PDF."}
  validates :proyecto_c, presence: {message: "Se requiere el proyecto presentado en formato PDF."}
  
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

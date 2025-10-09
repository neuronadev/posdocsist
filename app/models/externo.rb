class Externo < ApplicationRecord
  belongs_to :persona

  has_many :externoestancias
  has_many :estancias, through: :externoestancias

  accepts_nested_attributes_for :estancias, allow_destroy: true, reject_if: :all_blank
  
end

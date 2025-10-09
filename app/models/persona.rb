class Persona < ApplicationRecord
  belongs_to :tipopersona
  belongs_to :red
 
  has_one :externo

  accepts_nested_attributes_for :externo, allow_destroy: true, reject_if: :all_blank

end

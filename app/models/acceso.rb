class Acceso < ApplicationRecord
  belongs_to :persona
  belongs_to :usuario
  belongs_to :nivel
  
  
end

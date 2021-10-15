class Servicio < ApplicationRecord
  belongs_to :servidor
  belongs_to :aplicacion
end

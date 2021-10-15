class Empleado < ApplicationRecord

    validates :nombre, presence: true
    validates :rol, presence: true 
    validates :login, presence: true 
    validates :password, presence:true

end

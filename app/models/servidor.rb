class Servidor < ApplicationRecord

    has_many :servicios
    has_many :aplicaciones, through: :servicios #, source: :join_association_table_foreign_key_to_objects_table
    belongs_to :empleado

    validates :nombre, presence: true, length:{ minimum: 2}, uniqueness: true
    validates :ip, presence: true    
    validates :empleado, presence: true
end

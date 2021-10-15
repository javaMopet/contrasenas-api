class Servidor < ApplicationRecord

    has_many :servicios
    has_many :aplicaciones, through: :servicios #, source: :join_association_table_foreign_key_to_objects_table

    validates :nombre, presence: true
    validates :nombre, length:{ minimum: 2}
    validates :ip, presence: true    
    validates :nombre, uniqueness: true
end

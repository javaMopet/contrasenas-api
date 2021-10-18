class EmpleadoSerializer
  include JSONAPI::Serializer
  attributes :id, :nombre, :rol, :login
end

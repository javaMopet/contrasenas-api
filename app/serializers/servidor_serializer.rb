class ServidorSerializer
  include JSONAPI::Serializer
  attributes :id, :nombre, :ip
end

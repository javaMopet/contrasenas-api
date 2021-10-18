class AplicacionSerializer
  include JSONAPI::Serializer
  attributes :id, :nombre, :version
end

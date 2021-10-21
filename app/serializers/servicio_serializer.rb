class ServicioSerializer
  include JSONAPI::Serializer
  attributes :id, :servidor, :aplicacion, :puerto
end

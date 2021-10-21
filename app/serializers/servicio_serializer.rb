class ServicioSerializer
  include JSONAPI::Serializer
  attributes :servidor, :aplicacion, :puerto
end

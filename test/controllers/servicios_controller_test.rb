require "test_helper"

class ServiciosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @servicio = servicios(:one)
  end

  test "should get index" do
    get servicios_url, as: :json
    assert_response :success
  end

  test "should create servicio" do
    assert_difference('Servicio.count') do
      post servicios_url, params: { servicio: { aplicacion_id: @servicio.aplicacion_id, puerto: @servicio.puerto, servidor_id: @servicio.servidor_id } }, as: :json
    end

    assert_response 201
  end

  test "should show servicio" do
    get servicio_url(@servicio), as: :json
    assert_response :success
  end

  test "should update servicio" do
    patch servicio_url(@servicio), params: { servicio: { aplicacion_id: @servicio.aplicacion_id, puerto: @servicio.puerto, servidor_id: @servicio.servidor_id } }, as: :json
    assert_response 200
  end

  test "should destroy servicio" do
    assert_difference('Servicio.count', -1) do
      delete servicio_url(@servicio), as: :json
    end

    assert_response 204
  end
end

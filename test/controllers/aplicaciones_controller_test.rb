require "test_helper"

class AplicacionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @aplicacion = aplicaciones(:one)
  end

  test "should get index" do
    get aplicaciones_url, as: :json
    assert_response :success
  end

  test "should create aplicacion" do
    assert_difference('Aplicacion.count') do
      post aplicaciones_url, params: { aplicacion: { nombre: @aplicacion.nombre, version: @aplicacion.version } }, as: :json
    end

    assert_response 201
  end

  test "should show aplicacion" do
    get aplicacion_url(@aplicacion), as: :json
    assert_response :success
  end

  test "should update aplicacion" do
    patch aplicacion_url(@aplicacion), params: { aplicacion: { nombre: @aplicacion.nombre, version: @aplicacion.version } }, as: :json
    assert_response 200
  end

  test "should destroy aplicacion" do
    assert_difference('Aplicacion.count', -1) do
      delete aplicacion_url(@aplicacion), as: :json
    end

    assert_response 204
  end
end

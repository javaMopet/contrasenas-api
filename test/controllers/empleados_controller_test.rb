require "test_helper"

class EmpleadosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @empleado = empleados(:one)
  end

  test "should get index" do
    get empleados_url, as: :json
    assert_response :success
  end

  test "should create empleado" do
    assert_difference('Empleado.count') do
      post empleados_url, params: { empleado: { login: @empleado.login, nombre: @empleado.nombre, password: @empleado.password, rol: @empleado.rol } }, as: :json
    end

    assert_response 201
  end

  test "should show empleado" do
    get empleado_url(@empleado), as: :json
    assert_response :success
  end

  test "should update empleado" do
    patch empleado_url(@empleado), params: { empleado: { login: @empleado.login, nombre: @empleado.nombre, password: @empleado.password, rol: @empleado.rol } }, as: :json
    assert_response 200
  end

  test "should destroy empleado" do
    assert_difference('Empleado.count', -1) do
      delete empleado_url(@empleado), as: :json
    end

    assert_response 204
  end
end

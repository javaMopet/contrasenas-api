class SesionesController < ApplicationController
  skip_before_action :autorizar, only: [:create] 

  def create
    login = params[:login]
    password = params[:password] 
    empleado = Empleado.find_by_login(login)   

    if empleado and empleado.password == password 
      tokenExpiration = 40.minutes.from_now.to_i
      puts("Token expiration: #{tokenExpiration}")
      token = genera_token({id: empleado.id, nombre: empleado.nombre}, tokenExpiration)
      render json: {empleado: empleado, token: token, tokenExpiration: tokenExpiration}, status: :ok
    elsif empleado 
      render json: {mensaje: "Contraseña no válida."}, status: :unauthorized
    else 
      render json: {mensaje: "Usuario y contraseña no válidos."}, status: :unauthorized
    end 
  end

  def usuario_actual
    actual = current_user
    puts "id del usuario en sesion: #{actual['nombre']}" 
    render json: actual
  end 
end

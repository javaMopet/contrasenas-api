class EmpleadosController < ApplicationController
  before_action :set_empleado, only: [:show, :update, :destroy]
  skip_before_action :autorizar, only: [:create] 

  # GET /empleados
  def index
    @empleados = Empleado.all
    render json: serializer.new(@empleados), status: :ok
  end

  # GET /empleados/1
  def show
    render json: @empleado
  end

  # POST /empleados
  def create    
    @empleado = Empleado.new(empleado_params)
        
    begin
      if @empleado.save
        puts ("empleado guardado")
        exp = 40.minutes.from_now.to_i
        token = genera_token({id: @empleado.id, nombre: @empleado.nombre}, exp)
        render json: {empleado: @empleado, token: token, tokenExpiration: exp}, status: :created, location: @empleado        
        return
      end
    rescue ActiveRecord::RecordNotUnique => e
      messageError = (e.message.include? 'UNIQUE constraint') ? "La cuenta de correo ha sido ya está registrada previamente." : "Login UNIQUE"
      render json: {mensajeError: messageError}, status: :unprocessable_entity
    else
      puts("rescue else ")
      fullMessages = @empleado.errors.full_messages.to_s        
      messageError = (fullMessages.include? 'Login') ? 'La cuenta de correo ya ha sido registrada previamente' : fullMessages        
      render json: {mensajeError: messageError}, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /empleados/1
  def update
    if @empleado.update(empleado_params)
      render json: @empleado
    else
      render json: @empleado.errors, status: :unprocessable_entity
    end
  end

  # DELETE /empleados/1
  def destroy
    @empleado.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empleado
      @empleado = Empleado.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def empleado_params
      params.require(:empleado).permit(:nombre, :rol, :login, :password)
    end

    def serializer 
      EmpleadoSerializer
    end 
end

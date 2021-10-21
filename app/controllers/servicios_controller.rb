class ServiciosController < ApplicationController
  before_action :set_servicio, only: [:show, :update, :destroy]

  # GET /servicios
  def index
    servicios = Servicio.all
    sleep 2
    render json: serializer.new(servicios), statu: :ok
  end

  # GET /servicios/1
  def show
    render json: @servicio
  end

  # POST /servicios
  def create
    servicio = Servicio.new(servicio_params)
    puts(servicio)
    if servicio.save
      render json: serializer.new(servicio), status: :created, location: servicio
    else
      render json: {errors: servicio.errors,messages: servicio.errors.full_messages.to_s}, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /servicios/1
  def update
    if @servicio.update(servicio_params)
      render json: serializer.new(@servicio), status: :ok
    else
      render json: {errors: @servicio.errors,messages: @servicio.errors.full_messages.to_s}, status: :unprocessable_entity
    end
  end

  # DELETE /servicios/1
  def destroy
    @servicio.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_servicio
      @servicio = Servicio.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def servicio_params
      params.require(:servicio).permit(:servidor_id, :aplicacion_id, :puerto)
    end

    def serializer
      ServicioSerializer
    end 
end

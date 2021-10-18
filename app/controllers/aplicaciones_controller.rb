class AplicacionesController < ApplicationController
  before_action :set_aplicacion, only: [:show, :update, :destroy]

  # GET /aplicaciones
  def index
    @aplicaciones = Aplicacion.all
    render json: serializer.new(@aplicaciones), status: :ok
  end

  # GET /aplicaciones/1
  def show  
    render json: @aplicacion  
  end

  # POST /aplicaciones
  def create
    @aplicacion = Aplicacion.new(aplicacion_params)

    if @aplicacion.save
      render json: @aplicacion, status: :created, location: @aplicacion
    else
      render json: @aplicacion.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /aplicaciones/1
  def update
    if @aplicacion.update(aplicacion_params)
      render json: @aplicacion
    else
      render json: @aplicacion.errors, status: :unprocessable_entity
    end
  end

  # DELETE /aplicaciones/1
  def destroy
    @aplicacion.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aplicacion
      begin
      @aplicacion = Aplicacion.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: {error: "Registro no encontrado"}
      else
        @aplicacion
      end 
    end

    # Only allow a list of trusted parameters through.
    def aplicacion_params
      params.require(:aplicacion).permit(:nombre, :version)
    end

    def serializer 
      AplicacionSerializer
    end 
end

class ServidoresController < ApplicationController
    before_action :set_servidor, only: [:show, :update, :destroy ]

    def index 
        servidores = Servidor.select(:id, :nombre).all        
        servidores.where("id > 0")
        servidores.where("id < 15")
        render json: servidores.as_json(include: {aplicaciones: {only: [:id, :nombre]}}) 
    end 

    def show         
        render json: @servidor 
    end 

    def create        
        servidor = Servidor.new(servidor_params)
        if servidor.save
            render json: servidor 
        else
            render json: servidor.errors.full_messages, status: :unprocessable_entity 
        end  
    end 

    def update
        if @servidor.update(servidor_params)
            reder json: serializer.new(@servidor), status: :ok
        else 
        end 
    end 

    private 
    # Use callbacks to share common setup or constraints between actions.
    def set_servidor
        @servidor = Servidor.find(params[:id])
      end
    def servidor_params
        params.require(:servidor).permit(:nombre, :ip)
    end 
    def serializer 
        ServidorSerializer
    end 
end

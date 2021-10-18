class Api::V1::ServidoresController < ApplicationController
    before_action :set_servidor, only: [:show, :update, :destroy ]

    def index 
        puts('buscando servidores...')
        servidores = Servidor.all         
        render json: serializer.new(servidores), status: :ok        
    end 

    def show         
        render json: @servidor
    end 

    def create        
        servidor = Servidor.new(servidor_params)
        if servidor.save
            render json: serializer.new(servidor), status: :ok
        else
            render json: servidor.errors.full_messages, status: :unprocessable_entity 
        end  
    end 

    def update
        if @servidor.update(servidor_params)
            reder json: serializer.new(@servidor), status: :ok
        else 
            render json: @servidor.errors.full_messages, status: :unprocessable_entity 
        end 
    end 

    def destroy 
        
        if @servidor.delete
        render json: {message: 'eliminado'}, status: :ok
        else 
            render json: @servidor.errors, status: :unprocessable_entity 
        end 
    end 

    private 
    # Use callbacks to share common setup or constraints between actions.
    def set_servidor
        @servidor = Servidor.find(params[:id])
    end
    def servidor_params
        params.require(:servidor).permit(:nombre, :ip, :empleado_id)
    end 

    def serializer 
        ServidorSerializer
    end 
end

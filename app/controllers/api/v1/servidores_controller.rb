class Api::V1::ServidoresController < ApplicationController
    def index 
        puts('buscando servidores...')
        servidores = Servidor.all         
        render json: serializer.new(servidores), status: :ok        
    end 

    def show 
        servidor = Servidor.find(params[:id])
        render json: servidor 
    end 

    def create
        puts servidor_params
        servidor = Servidor.new(servidor_params)
        if servidor.save
            render json: serializer.new(servidor), status: :ok
        else
            render json: servidor.errors, status: :unprocessable_entity 
        end  
    end 

    def destroy 
        servidor = Servidor.find(params[:id])        
        if servidor.delete
        render json: {message: 'eliminado'}, status: :ok
        else 
            render json: servidor.errors, status: :unprocessable_entity 
        end 
    end 

    private 

    def servidor_params
        params.require(:servidor).permit(:nombre, :ip)
    end 

    def serializer 
        ServidorSerializer
    end 
end

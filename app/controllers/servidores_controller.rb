class ServidoresController < ApplicationController
    def index 
        servidores = Servidor.select(:id, :nombre).all
        puts servidores.class
        servidores.where("id > 0")
        servidores.where("id < 15")
        render json: servidores.as_json(include: {aplicaciones: {only: [:id, :nombre]}}) 
    end 

    def show 
        servidor = Servidor.find(params[:id])
        render json: servidor 
    end 

    def create
        puts servidor_params
        servidor = Servidor.new(servidor_params)
        if servidor.save
            render json: servidor 
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

class ApplicationController < ActionController::API
    before_action :autorizar

    KEY = 'miPalabraSecreta'

    def header_authorization
        encabezado = request.headers['Authorization']
        puts("Encabezado:" + encabezado)
        encabezado.split(' ').last if encabezado         
    end 

    def autorizar 
        #'Autorization: Bearer fa35sd1f2a1sdf65a1sdf321asdf51a6dsf'
        #'content-type: application/json'
        token  = header_authorization
        if token
            begin
                JWT.decode(token,KEY)
            rescue JWT::VerificationError => exception
                render json: {mensaje: "Token no válido"}, status: :unauthorized
            rescue JWT::ExpiredSignature => exception
                render json: {mensaje: "Token expirado"}, status: :forbidden
            end
        else
            render json: {mensaje: "Iniciar sesión"}, status: :unauthorized
        end 
    end 



    def current_user 
        token = header_authorization
        if token 
            payload = JWT.decode(token, KEY).first
            #render json: payload[0]
        end 
    end 

    def genera_token(payload, expiracion)
        payload[:exp] = expiracion 
        JWT.encode(payload,KEY)
    end 
end

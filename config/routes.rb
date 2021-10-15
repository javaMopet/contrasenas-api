Rails.application.routes.draw do

  resources :servicios
  post 'sesiones/create'
  get 'sesiones/usuario_actual'
  
  namespace :api do 
    namespace :v1 do 
      resources :servidores
    end 
  end

  resources :sesiones
  resources :empleados
  resources :aplicaciones
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end

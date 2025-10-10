Rails.application.routes.draw do
     
  get 'paginas/index'
  devise_for :usuarios

  resources :estancias
  resources :personas
  resources :validaciones do
        collection do
             post "validar"
        end
  end
  
  resources :solicitudes do
        collection do
             post "atendida"
        end
  end

  resources :finalizados

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "paginas#index"
end

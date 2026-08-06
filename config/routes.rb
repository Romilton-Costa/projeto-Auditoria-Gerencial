Rails.application.routes.draw do
    # Páginas principais (cada uma com seu controller)
  get "/afastamentos", to: "afastamentos#index", as: :afastamentos
  get "/sem_passos", to: "sem_passos#index", as: :sem_passos
  get "/sem_andamentos", to: "sem_andamentos#index", as: :sem_andamentos
  get "/caixafuncao", to: "caixafuncao#index", as: :caixafuncao
  get "/enderecos", to: "enderecos#index", as: :enderecos
  get "/duplicados", to: "duplicados#index", as: :duplicados
  get "/peticionados", to: "peticionados#index", as: :peticionados
  get "/infraestruturas", to: "infraestruturas#index", as: :infraestruturas
  get "/evolucao", to: "evolucao#index", as: :evolucao
  get "/detalhes", to: "detalhes#index", as: :detalhes
  get "/clientes", to: "clientes#index", as: :clientes
  get "/configuracao", to: "configuracao#index", as: :configuracao
   get '/monitoring', to: 'monitoring#index', as: :monitoring
  resources :client_details
  resources :audit_details
  resources :audit_results
  resources :audit_executions
  resources :audit_rules
  resources :clients
  devise_for :users


  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "dashboard#index"
end

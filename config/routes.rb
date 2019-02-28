Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get 'relevedecomptes', to: 'chatfuels#relevedecomptes'
      get 'gestioncagnottes', to: 'chatfuels#gestioncagnottes'
      get 'gestiondepargne', to: 'chatfuels#gestiondepargne'
    end
  end

  get 'show_cb', to: 'webviews#show_cb'
  get 'show_cagnotte', to: 'webviews#show_cagnotte'
  get 'ma_depargne', to: 'webviews#ma_depargne'
  get 'associer_ssr', to: 'webviews#associer_ssr'


  resources :cagnottes, only: [ :new, :create, :edit, :update, :destroy ]
  resources :epargnes
end

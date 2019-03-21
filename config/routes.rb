Rails.application.routes.draw do
  devise_for :users, controllers: {
           :sessions => "users/sessions",
           :registrations => "users/registrations" }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get 'relevedecomptes', to: 'chatfuels#relevedecomptes'
      get 'gestioncagnottes', to: 'chatfuels#gestioncagnottes'
      get 'gestiondepargne', to: 'chatfuels#gestiondepargne'
      get 'gestionssr', to: 'chatfuels#gestionssr'
      get 'menuquickreplies', to: 'chatfuels#menuquickreplies'
      get 'redirecttomenu', to: 'chatfuels#redirecttomenu'
      get 'veriftoken', to: 'chatfuels#veriftoken'
      resources :leads, only: [:create]
    end
  end

  get 'show_cb', to: 'webviews#show_cb'
  get 'show_cagnotte', to: 'webviews#show_cagnotte'
  get 'ma_depargne', to: 'webviews#ma_depargne'
  get 'ssr_pluie', to: 'webviews#ssr_pluie'
  get 'ssr_cigarette', to: 'webviews#ssr_cigarette'
  get 'ssr_virement', to: 'webviews#ssr_virement'
  get 'associer_ssr', to: 'webviews#associer_ssr'


  resources :cagnottes, only: [ :new, :create, :edit, :update, :destroy ]
  resources :epargnes
end

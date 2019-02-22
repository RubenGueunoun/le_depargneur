Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get 'relevedecomptes', to: 'chatfuels#relevedecomptes'
      get 'gestioncagnottes', to: 'chatfuels#gestioncagnottes'
    end
  end

  get 'show_cb', to: 'webviews#show_cb'
  get 'show_cagnotte', to: 'webviews#show_cagnotte'

  resources :cagnottes, only: [ :new, :create, :edit, :update, :destroy ]
end

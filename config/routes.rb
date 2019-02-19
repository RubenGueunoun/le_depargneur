Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :cagnottes, only: [ :index, :show, :update, :create ]
      get 'relevedecomptes', to: 'chatfuels#relevedecomptes'
    end
  end

  get 'show_cb', to: 'webviews#show_cb'
end

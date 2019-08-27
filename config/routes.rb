Rails.application.routes.draw do
  get 'dashboards/show'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/dashboard', to: 'dashboards#show'

  resources :projects do
    resources :versions, only: [:create]
  end

  resources :versions, only: [:index] do
    resources :color_swatches, only: [:create]
  end
end

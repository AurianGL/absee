Rails.application.routes.draw do
  get 'dashboards/show'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/dashboard', to: 'dashboards#show'
  get '/projects/:id', to: 'projects#show'
  get '/projects/:id/versions/:version_id', to: 'projects#show'

end

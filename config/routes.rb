Rails.application.routes.draw do
  get 'sessions/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root "events#index"
  
  resources :users
  resources :events do
    resources :reports, shallow: true
  end
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
end

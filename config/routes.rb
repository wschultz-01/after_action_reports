Rails.application.routes.draw do
  get 'sessions/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root "events#index"
  
  resources :events do
    resources :reports, shallow: true
  end
  
  resources :users
  
end

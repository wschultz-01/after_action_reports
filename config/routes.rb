Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get "/events", to: "events#index"
  get "/events/:id", to: "events#show"
  root "events#index"
  
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: "health#index"
  get "/details", to: "health#details"
  get "/health", to: "health#health"
end

Rails.application.routes.draw do
  resources :products, only: [:show, :update]
  get "/", to: "landing#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

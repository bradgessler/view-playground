Rails.application.routes.draw do
  resources :pancakes
  get "/phlex", to: "phlex#index"
  root "pancakes#index"
end

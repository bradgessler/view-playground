Rails.application.routes.draw do
  resources :pancakes
  root "pancakes#index"
end

Rails.application.routes.draw do
  sitepress_pages
  sitepress_root
  resources :pancakes
end

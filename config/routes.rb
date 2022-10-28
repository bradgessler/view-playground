Rails.application.routes.draw do
  sitepress_pages
  sitepress_root
  resources :pancakes

  get "waffles", to: Resources::Pancake::Index.action(:perform)
  get "waffles/new", to: Resources::Pancake::New.action(:perform)
  post "waffles", to: Resources::Pancake::Create.action(:perform)
  get "waffles/:id", to: Resources::Pancake::Show.action(:perform)
  get "waffles/:id/edit", to: Resources::Pancake::Edit.action(:perform)
  patch "waffles/:id", to: Resources::Pancake::Update.action(:perform)
  delete "waffles/:id", to: Resources::Pancake::Destroy.action(:perform)
end

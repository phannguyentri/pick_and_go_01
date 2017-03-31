Rails.application.routes.draw do
  mount Ckeditor::Engine => "/ckeditor"

  root "static_pages#home"
  resources :destinations
  resources :locations
  resources :events
  resources :users

  namespace :admin do
    root "static_pages#home"
    resources :users
    resources :destinations
    resources :locations
    resources :events
  end
end

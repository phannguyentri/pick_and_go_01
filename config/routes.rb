Rails.application.routes.draw do
  mount Ckeditor::Engine => "/ckeditor"

  devise_for :users, :controllers => { registrations: "users/registrations" }
  root "static_pages#home"
  resources :destinations
  resources :locations
  resources :events
  resources :users
  resources :posts
  resources :culturals

  namespace :admin do
    root "static_pages#home"
    resources :users
    resources :destinations
    resources :locations
    resources :events
    resources :posts
    resources :notification_events
    resources :join_events
    resources :culturals
    resources :categories
  end
end

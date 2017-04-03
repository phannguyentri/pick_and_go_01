Rails.application.routes.draw do
  mount Ckeditor::Engine => "/ckeditor"

  devise_for :users, :controllers => { registrations: "users/registrations" }
  root "static_pages#home"
  resources :destinations
  resources :locations
  resources :events

  namespace :admin do
    root "static_pages#home"
    resources :users
    resources :destinations
    resources :locations
    resources :events
  end
end

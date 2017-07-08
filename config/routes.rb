Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "users/registrations"}
  root 'welcome#index'
  resources :introductions
  resources :notices

  namespace :admin do
    resources :introductions
    resources :notices
  end

  namespace :account do
    resources :users
  end
end

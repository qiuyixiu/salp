Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "users/registrations"}
  root 'welcome#index'
  resources :introductions

  namespace :admin do
    resources :introductions
  end

  namespace :account do
    resources :users
  end
end

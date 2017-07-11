Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, :controllers => { :registrations => "users/registrations"}
  root 'welcome#index'

  resources :introductions

  resources :notices

  resources :messages do
    member do
      post :join
      post :quit
    end
  end
  
  resources :games

  namespace :admin do
    resources :introductions
    resources :notices
    resources :messages do
      member do
        post :publish
        post :hide
      end
    end
    resources :games
  end

  namespace :account do
    resources :users
    resources :message_collections
  end
end

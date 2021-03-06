Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, :controllers => { :registrations => "users/registrations"}
  root 'welcome#index'
  get 'ads/index'

  resources :introductions

  resources :notices

  resources :messages do
    member do
      post :join
      post :quit
    end
  end

  resources :offers do
    member do
      post :join
      post :quit
    end
  end

  resources :games
  resources :industries
  resources :educations
  resources :lists
  resources :works
  resources :exchanges do
    resources :comments
  end

  namespace :admin do
    resources :introductions
    resources :notices
    resources :messages do
      member do
        post :publish
        post :hide
      end
    end
    resources :offers do
      member do
        post :publish
        post :hide
      end
    end
    resources :games
    resources :industries
    resources :educations
    resources :lists
    resources :works
    resources :exchanges do
      member do
        post :publish
        post :hide
      end
    end
    resources :users
  end

  namespace :account do
    resources :users
    resources :message_collections
    resources :offer_collections
    resources :exchange_collections
  end
end

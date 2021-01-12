Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { registrations: 'user/registrations', sessions: 'user/sessions' }
  devise_for :admins, controllers: { registrations: 'admin/registrations', sessions: 'admin/sessions' }

  namespace :admin do
    resources :books do
      member do
        patch :publish
        patch :unpublish
      end
      # resources :orders, only: [ :index, :create]
    end
    resources :orders, only: [:index, :update] do
      member do
        patch :accepted
        patch :rejected
      end
      collection do
        get :pending_orders
      end
    end
    resources :users, only: [:index]
  end

  namespace :user do
    resources :books, only: [:index,:show] do
      collection do
        get :inventory
      end
      resources :orders, only: [:create]
    end
  end

  root 'home#index'
end

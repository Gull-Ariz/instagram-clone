# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root 'posts#index', as: :authenticated_root
      resources :posts do
        resources :likes, only: %i[create destroy], shallow: true
        resources :comments, only: %i[create edit update destroy], shallow: true
      end
      resources :stories, only: %i[index new create show destroy]
      resources :users, only: %i[index show] do
        member do
          post :follow
          post :unfollow
          post :accept_request
          get :followers
          get :followeds
        end
      end
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

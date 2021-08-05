Rails.application.routes.draw do
  get 'post/index'
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root 'post#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  resource :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

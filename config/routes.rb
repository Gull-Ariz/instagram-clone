Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root 'posts#index', as: :authenticated_root
      resources :posts do
        member do
          delete :delete_image_attachment
        end
      end
      resources :stories, only: [:index, :new, :create, :show, :destroy]
      resources :users, only: [:show] do
        member do
          post :follow
          post :unfollow
        end
      end
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root 'users#home_page', as: :authenticated_root
      resources :posts do
        member do
          delete :delete_image_attachment
        end
      end
      resources :stories
      get "profile/:id", to: "users#profile", as: :profile
      post "follow/user", to: "users#follow_user"
      post "unfollow/user", to: "users#unfollow_user"
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

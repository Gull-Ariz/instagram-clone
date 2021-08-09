Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root 'account#home_page', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  resources :posts do
    member do
      delete :delete_image_attachment
    end
  end
  resources :stories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

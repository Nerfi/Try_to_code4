Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :gyms do
    resources :reviews, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

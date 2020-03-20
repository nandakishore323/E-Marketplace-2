Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'user/:id', to: 'user#show', as: 'user'
  # post '/comment/:comment_id/reply', to: 'replies_#create', as: 'reply'
  get 'user/show'
  get 'searches/new'
  get 'searches/create'
  get 'searches/show'
  post 'comments/create'
  post 'comments/destroy'
  resources :products do
    resources :comments
    resources :charges, only: [:new, :create]
  end
  post 'products/:product_id/:comment_id/reply', to: 'replies_#create', as: 'create_reply'
  devise_for :users, controllers: {omniauth_callbacks: 'omniauth'}
  resources :charges
  resources :searches
  root to: 'products#index'
  get "about", to: "pages#about"
  get "contact_us", to: "pages#contact_us"
  post 'products/add_comment'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

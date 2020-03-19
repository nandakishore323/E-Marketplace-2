Rails.application.routes.draw do
<<<<<<< HEAD
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
=======
  get '/user/:id', to: 'user#show', as: 'user'
  # post '/comment/:comment_id/reply', to: 'replies_#create', as: 'reply'
  get 'user/show'
>>>>>>> c3cb37697f4c02237f25d49e37670600cce0fe43
  get 'searches/new'
  get 'searches/create'
  get 'searches/show'
  post 'comments/create'
  post 'comments/destroy'
  resources :products do
    resources :comments
    resources :charges, only: [:new, :create]
  end
  devise_for :users, controllers: {omniauth_callbacks: 'omniauth'}
  resources :charges
  resources :searches
  root to: 'products#index'
  get "about", to: "pages#about"
  get "contact_us", to: "pages#contact_us"
  post 'products/add_comment'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

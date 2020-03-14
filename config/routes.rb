Rails.application.routes.draw do
  get 'searches/new'
  get 'searches/create'
  get 'searches/show'
  post 'comments/create'
  post 'comments/destroy'
  resources :products do
    resources :comments do
      resources :replies
    end
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

Rails.application.routes.draw do
  devise_for :users
  resources :posts
  resources :users do
    resources :posts, controller: "user_posts"
    resources :friendships, controller: "user_friendships"
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  devise_scope :user do
    root "devise/sessions#new"
  end
end

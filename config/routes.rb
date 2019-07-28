Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'top#index'
  resources :posts,except:[:index] do
    resources :comments,only:[:create,:destroy]
    resources :favorites,only:[:create,:destroy]
  end
  resources :users,only:[:index,:show]
  resources :categories do
    resources :posts,only:[:index]
  end
  get 'search', to: 'posts#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
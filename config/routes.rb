Rails.application.routes.draw do
  devise_for :users
  root 'categories#index'
  resources :posts,except:[:index] do
    resources :comments,only:[:create,:destroy]
    resources :favorites,only:[:create,:destroy]
  end
  resources :users,only:[:index,:show]
  resources :categories do
    resources :posts,only:[:index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
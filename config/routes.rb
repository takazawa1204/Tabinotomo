Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get '/users/my_page' => 'users#show'
  
  resources :users, only: [:show, :edit, :update]
end

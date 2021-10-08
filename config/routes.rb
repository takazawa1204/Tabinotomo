Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get '/users/my_page' => 'users#show'
  
  resources :users, only: [:show, :edit, :update]
  resources :iteneraries, only: [:new, :create, :index, :show, :edit, :update] do
    resources :belongings, only: [:create, :destroy]
    resources :schedules, only: [:create, :destroy, :index, :edit, :update]
  end
  
end

Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get '/about' => 'homes#about', as: 'about'
  get '/users/my_page' => 'users#show'
  get '/search', to: 'searchs#search'

  resources :users, only: [:show, :edit, :update]
  resources :iteneraries, only: [:new, :create, :index, :show, :edit, :update] do
    resources :belongings, only: [:create, :destroy]
    resources :schedules, only: [:create, :destroy, :index, :edit, :update]
    resources :albums, only: [:create, :destroy, :index, :edit, :update]
    resource :favorites, only: [:create, :destroy]
  end
end

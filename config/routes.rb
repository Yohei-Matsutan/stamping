Rails.application.routes.draw do
  root to: 'homes#top'

  get 'users/main'
  resources :users, only: [:index]

  post 'stamps/clock_in', as: 'clock_in'
  patch 'stamps/clock_out', as: 'clock_out'
  resources :stamps, only: [:show]
  
  get 'stamps/index'
  get 'stamps/edit'
  get 'stamps/update'
  get 'stamps/destroy'
  get 'homes/top'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

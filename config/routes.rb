Rails.application.routes.draw do
  root to: 'homes#top'

  devise_for :users
  get 'users/main'
  patch 'users/:id/authorize' => 'users#authorize', as: 'authorize'
  resources :users, only: [:index, :show]

  post 'stamps/clock_in', as: 'clock_in'
  patch 'stamps/clock_out', as: 'clock_out'
  resources :stamps, only: [:show, :destroy, :edit]
  
  get 'stamps/index'
  get 'stamps/edit'
  get 'stamps/update'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

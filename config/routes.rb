Rails.application.routes.draw do
  root to: 'homes/top'

  get 'stamps/index'
  get 'stamps/show'
  get 'stamps/edit'
  get 'stamps/update'
  get 'stamps/destroy'
  get 'homes/top'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

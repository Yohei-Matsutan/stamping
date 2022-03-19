Rails.application.routes.draw do
  root to: 'homes#top'
  
  get 'edit_logs/new'
  get 'edit_logs/create'
  get 'stamps/clock_on'
  get 'stamps/clock_out'
  get 'stamps/edit'
  get 'stamps/update'
  
  devise_for :workers, controllers: {
    sessions: 'workers/sessions',
    passwords: 'workers/passwords',
    registrations: 'workers/registrations'
  }
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
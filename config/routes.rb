Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  get 'start_display/index'

  # resources :tasks

  resources :tasks do
    resources :comments
  end

  root 'start_display#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

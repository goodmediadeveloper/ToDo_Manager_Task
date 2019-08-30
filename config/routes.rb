Rails.application.routes.draw do
  get 'start_display/index'

  root 'start_display#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

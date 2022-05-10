Rails.application.routes.draw do
  get 'bands/index'
  get 'bands/new'
  get 'bands/edit'
  get 'bands/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show]
  resource :sessions, only: [:new, :create, :destroy]
end

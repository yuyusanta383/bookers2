Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#top'
  get '/home/about', to: 'homes#about'
  resources :users, only: [:show,:index,:create,:update,:edit,:destroy,:new]
  resources :books, only: [:show,:index,:create,:update,:edit,:destroy,:new]
end

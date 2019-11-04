Rails.application.routes.draw do
  get 'pages/top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  get 'users/new/email', to; 'users#email'

  root 'pages#top'
end

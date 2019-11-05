Rails.application.routes.draw do
  get 'sessions/new'
  get 'pages/top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users do
    collection do
      get :signup
    end
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sesson#destroy'

  root 'pages#top'
end

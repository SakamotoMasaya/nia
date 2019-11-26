Rails.application.routes.draw do
  get 'pages/top'
  root 'pages#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users do
    collection do
      get :signup
    end
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/mypage', to: 'mypages#top'

  get '/sell', to: 'items#new'
  post '/sell', to: 'items#create'
  resources :items do
    resources :buy_request, only: %i[index create]
  end

  resources :relationships, only: %i[create destroy]

  resources :favorites, only: %i[index create destroy]
end

Rails.application.routes.draw do
  get 'pages/top'
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

  root 'pages#top'
end

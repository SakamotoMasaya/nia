Rails.application.routes.draw do
  get 'pages/top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users do
    collection do
      get :signup
    end
  end

  root 'pages#top'
end

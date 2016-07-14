Rails.application.routes.draw do

  get '/auth/google_oauth2', as: '/login'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  # get 'auth/failure', to: redirect('/')

  resources :teams, only: [:index, :new, :create, :show] do
    resources :games, only: [:new, :create]
  end



  root 'teams#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

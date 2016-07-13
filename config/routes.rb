Rails.application.routes.draw do

  resources :teams, only: [:index, :new, :create, :show] do
    resources :games, only: [:new, :create]
  end



  root 'teams#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

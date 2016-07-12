Rails.application.routes.draw do

  resources :teams, only: [:index, :new, :create] do
    resources :games, only: [:index, :new, :create]
  end



  root 'teams#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

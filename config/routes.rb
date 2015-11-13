Rails.application.routes.draw do

  root to: "welcome#index"

  resources :users do
  	resources :posts
  end

  resources :cities do 
  	resources :posts
  end

  get '/sign_in', to: 'sessions#new'

  post '/sessions', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy'



end

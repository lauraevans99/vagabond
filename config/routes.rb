Rails.application.routes.draw do

  root to: "welcome#index"

  resources :users

  get '/sign_in', to: 'sessions#new'

  post '/sessions', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy'

  # resources :posts

end

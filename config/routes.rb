Rails.application.routes.draw do

  root to: "welcome#index"

  resources :users

  get '/sign_in', to: 'sessions#new'

  post '/sessions', to: 'sessions#create'

end

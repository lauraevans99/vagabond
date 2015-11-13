Rails.application.routes.draw do

  root to: "welcome#index"

  resources :users do
  	resources :posts
  end

  get '/sign_in', to: 'sessions#new'

  post '/sessions', to: 'sessions#create'

  get '/logout', to: 'sessions#destroy'

  get '/cities/:id/posts', to: 'cities#show'

  get '/cities', to: 'cities#index'

end

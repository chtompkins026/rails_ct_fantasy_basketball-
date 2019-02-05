Rails.application.routes.draw do
  root 'users#new'
  resources :users, :leagues, :sessions

  resources :teams do
    resources :players
  end

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  get 'users/players'
  get 'users/teams'
  get 'users/league'

  get '/join_league' =>'leagues#index'
  get '/join_league/:id' =>'teams#new', as: "join_a_league"
  post '/leagues/:id' => 'leagues#update'

  get '/auth/facebook/callback' => 'sessions#create'

end

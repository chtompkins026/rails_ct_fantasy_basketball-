Rails.application.routes.draw do
  root 'users#new'
  resources :users, :leagues, :teams, :sessions, :players

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

end

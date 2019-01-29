Rails.application.routes.draw do
  root 'users#new'
  resources :users, :leagues, :teams, :sessions

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'
  get '/join_league' =>'leagues#index'
  get 'users/players'
  get 'users/teams'
  get 'users/league'

end

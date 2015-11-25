Rails.application.routes.draw do
  root 'users#welcome'
  get '/auth/:provider/callback', to: 'sessions#create'
  get "/signout" => "sessions#destroy", :as => :signout

  get 'users/select' => 'users#index', as: :team_select

  resources :users
  resources :teams
  resources :notes
  	resources :votes do 
  		patch "upvote", on: :collection 
  	end
  	resources :comments
  end
end

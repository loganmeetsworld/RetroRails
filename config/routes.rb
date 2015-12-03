Rails.application.routes.draw do
  root :to => 'welcome#index'
  get "about" => 'welcome#about'

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "teams#new", :as => "sign_up"
  
  resources :teams do
    resources :retros do 
      resources :notes
    end
  end
  
  resources :sessions
end

RPO::Application.routes.draw do
  root to: 'splashes#show'

  resources :authors
  resources :books
  
  resources :searches
  match '/search'							, to: 'searches#index', :via => :get
  
  resources :sessions						, only: [:new, :create, :destroy]
  match '/signin'							, to: 'sessions#create'
  match '/signout'							, to: 'session#destroy'
  
  
end

RPO::Application.routes.draw do
  root to: 'splashes#show'

  resources :authors
  resources :books
  
  resources :sessions						, only: [:new, :create, :destroy]
  match '/signin'							, to: 'sessions#create'
  match '/signout'							, to: 'session#destroy'
  
  
end

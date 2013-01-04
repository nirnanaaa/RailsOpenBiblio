RPO::Application.routes.draw do
  root to: 'splashes#show'

  resources :authors
  match '/author/by-name/:author'			, to: 'authors#name'
  
  resources :books
  match '/book/by-name/:book'				, to: 'books#name'
  
  resources :searches
  match '/search'							, to: 'searches#search', :via => :get
  
  resources :sessions						, only: [:new, :create, :destroy]
  match '/signin'							, to: 'sessions#create'
  match '/signout'							, to: 'session#destroy'
  
  
end

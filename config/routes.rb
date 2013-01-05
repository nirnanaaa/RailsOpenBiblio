RPO::Application.routes.draw do
  root :to => 'splashes#show'

  resources :tags
  match '/tag/:tag'							, to: 'tags#show'		, :via => :get
  
  resources :authors
  match '/author/:author'					, to: 'authors#name'	, :via => :get
  
  resources :books
  match '/book/:book'						, to: 'books#name'		, :via => :get
  
  match '/user/:name'						, to: 'users#show'		, :via => :get
  match '/user/:name/edit'					, to: 'users#edit'		, :via => :get
  
  resources :searches
  match '/search'							, to: 'searches#search'	, :via => :get
  
  resources :sessions						, only: [:new, :create, :destroy]
  match '/signin'							, to: 'sessions#create'
  match '/signout'							, to: 'session#destroy'
  
  
end

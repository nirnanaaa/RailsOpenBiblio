RPO::Application.routes.draw do
  root :to => 'splashes#show'

  resources :tags
  match '/tag/:tag'							, to: 'tags#show'		, :via => :get
  
  resources :authors
  match '/author/:author'					, to: 'authors#name'	, :via => :get
  
  resources :books
  match '/book/:book'						, to: 'books#name'		, :via => :get
  match '/book/:book/download'  , to: 'book/downloads#index'
  match '/book/:book/lend'      , to: 'book/lends#index'
  match '/book/:book/book'      , to: 'book/books#index'
  match '/book/:book/stats'     , to: 'book/stats#index'
  match '/book/:book/link/new'  , to: 'book/links#index'

  match '/user/:name'						, to: 'users#show'		, :via => :get
  match '/user/:name/edit'					, to: 'users#edit'		, :via => :get
  
  resources :searches
  match '/search'							, to: 'searches#search'	, :via => :get
  
  resources :sessions						, only: [:new, :create, :destroy]
  match '/signin'							, to: 'sessions#create'
  match '/signout'							, to: 'session#destroy'
  
  
end

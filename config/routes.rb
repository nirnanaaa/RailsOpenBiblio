RPO::Application.routes.draw do
  root :to => 'splashes#show'

  resources :tags
  match '/tag/:tag'							, to: 'tags#show'		, :via => :get
  
  resources :authors
  match '/author/:author'					, to: 'authors#name'	, :via => :get
  
  resource :genres
  match '/genre/:genre'           , to: 'genres#index', :via => :get
  
  resources :books
  namespace :book do
    scope ":book" do
        #
        #Root Path of books view page. Shows the books mainpage
        #
        match '/'            , to: 'books#show'    , :via => :get
        
        resources :links
        match '/link/add'   , to: 'links#new'     , :as => "links_path"
        
        resources :lends
        match '/lend'       , to: 'lend#index'
    
        resources :stats
        match '/stats'      , to: 'stats#index'
    
        resource :downloads
        match '/download'   , to: 'downloads#index'
    
        resources :books
        match '/book'       , to: 'books#index'
    end
  end


  match '/user/:name'						, to: 'users#show'		, :via => :get
  match '/user/:name/edit'					, to: 'users#edit'		, :via => :get
  
  resources :searches
  match '/search'							, to: 'searches#search'	, :via => :get, :as => "search"
  
  resources :sessions						, only: [:new, :create, :destroy]
  match '/signin'							, to: 'sessions#create'
  match '/signout'							, to: 'session#destroy'
  
  
end

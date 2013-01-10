RPO::Application.routes.draw do
  root :to => 'splashes#show'

  resources :tags
  match '/tag/:tag'							  , to: 'tags#show'	                 , :via => :get,  :as => "tag_view"
  
  resource :genres
  match '/genre/:genre'           , to: 'genres#index'                , :via => :get
   
  resources :authors
  
  namespace :author do
    scope ":author" do
      match '/'                   , to: 'infos#show'                  ,:via => :get,  :as => "info"
      resources :infos,           :only => [:show]
    end
  end

  
  
  resources :books
  namespace :book do
    scope ":book" do
        #
        #Root Path of books view page. Shows the books mainpage
        #
        match '/'           , to: 'books#show'                                      , :via => :get,    :as => "root"
        
        resources :links
        match '/link/add'   , to: 'links#new'                                       ,:as  => "links_path"
        
        resources :lends
        match '/lend'       , to: 'lend#index'                                      ,:as  => "book_lend"
    
        resources :stats
        match '/stats'      , to: 'stats#index'                                     ,:as  => "book_stats"
    
        resource :downloads
        match '/download'   , to: 'downloads#index'                                 ,:as  => "book_download"
    
        resources :books
        match '/book'       , to: 'books#index'                                     ,:as  => "book_book"
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

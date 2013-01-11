RPO::Application.routes.draw do
  root :to => 'splashes#show'

  resources :tags                 , :except => :show
  match '/tag/:tag'							  , to: 'tags#show'	                              , :via => :get,       :as => "tag_view"
  
  resource :genres
  match '/genre/:genre'           , to: 'genres#index'                            , :via => :get,       :as => "genre_view"
   
  #authors
  resources :authors              , :only => [:index,:destroy,:edit,:create, :new]
  
  #/author
  namespace :author do
    scope ":author" do
      match '/'                   , to: 'infos#show'                              , :via => :get,       :as => "info"
      resources :infos            , :only => [:show]                    
    end
  end
  #//authors
  
  #books
  resources :books
  
  #/book
  namespace :book do
    scope ":book" do
        #
        #Root Path of books view page. Shows the books mainpage
        #
        match '/'               , to: 'books#show'                                  , :via => :get,     :as => "root"
        
        resources :links
        match '/link/add'       , to: 'links#new'                                   , :as  => "links"
        
        resources :lends
        match '/lend'           , to: 'lends#index'                                 , :as  => "lend"
    
        resources :stats
        match '/stats'          , to: 'stats#index'                                 , :as  => "stats"
    
        resource :downloads
        match '/download'       , to: 'downloads#index'                             , :as  => "download"
    
        resources :books
        match '/book'           , to: 'books#index'                                 , :as  => "book"
    end
  end
  #//books
  
  #/user
  namespace :user do
    resources :user_sessions      , :as => "sessions"
    resources :users
    match '/signin'               , to: 'user_sessions#create'                      , :as => "signin"
    match '/signout'              , to: 'user_sessions#destroy'                     , :as => "signout"
    
    scope ":name" do
        #Root path
        match '/'               , to: 'users#show'                                  , :via => :get,       :as => "root"
        match '/edit'           , to: 'users#edit'                                  , :as => "edit"
        
        ##
        match '/stats'          , to: 'stats#show'                                  , :via => :get,       :as => "stats"
        
    end
  end
  
  resources :searches
  match '/search'							  , to: 'searches#search'	                            , :via => :get,       :as => "search"
  
  
end

RPO::Application.routes.draw do
  root to: "splashes#show"

  resources :tags                 , except: :show
  match "/tag/:tag"							  , to: "tags#show"	                              , via: "get",       as: "tag_view"
  
  resource :genres
  match "/genre/:genre"           , to: "genres#index"                            , via: "get",       as: "genre_view"
   
  #authors
  resources :authors              , only: [:index,:destroy,:edit,:create, :new]
  
  #/author
  namespace :author do
    scope ":author" do
      match "/"                   , to: "infos#show"                              , via: "get",       as: "info"
      resources :infos            , only: [:show]                    
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
        match "/"               , to: "books#show"                                  , via: "get",     as: "root"
        
        resources :links
        match "/link/add"       , to: "links#new"                                   ,as: "links"
        
        resources :lends
        match "/lend"           , to: "lends#index"                                 ,as: "lend"
    
        resources :stats
        match "/stats"          , to: "stats#index"                                 ,as: "stats"
    
        resource :downloads
        match "/download"       , to: "downloads#index"                             ,as: "download"
    
        resources :books
        match "/book"           , to: "books#index"                                 ,as: "book"
    end
  end
  #//books
  
  #/user
  namespace :user do
    resources :user_sessions    , as: "sessions"
    resources :users
    match "/signin"             , to: "user_sessions#create"                      , as: "signin"
    match "/signout"            , to: "user_sessions#destroy"                     , as: "signout"
    scope "self" do
      match "/"                 , to: "stats#index"                               , as: "self"
      match "/edit"             , to: "stats#edit"                                , as: "self_edit"
      match "/update"           , to: "stats#update"                              , as: "self_update"
    end
    

    scope ":name" do
        #Root path
        match "/"               , to: "users#show"                                  , via: "get",       as: "root"
        match "/edit"           , to: "users#edit"                                  , as: "edit"
        
        ##
        match "/stats"          , to: "stats#show"                                  , via: "get",       as: "stats"
        
    end
  end
  
  namespace :admin do
    match "/"                   , to: "indexes#index"                               , via: "get",       as: "root"
    resources :indexes

    
    resources :users            , only: [:update, :edit]
    scope "/users" do
      match "/manage"           , to: "users#manage"                                , as: "users_manage"
      match "/update"           , to: "users#update"                                , as: "users_update"
      match "/inactive"         , to: "users#inactive"                              , as: "users_inactive"
      match "/roles"            , to: "users#roles"                                 , as: "users_roles"
      match "/custom"           , to: "users#custom"                                , as: "users_custom"
    end
    
    resources :groups           , only: [:update, :edit]
    scope "/groups" do
      match "/manage"           , to: "groups#manage"                                , as: "groups_manage"
      match "/update"           , to: "groups#update"                                , as: "groups_update"
      match "/roles"            , to: "groups#roles"                                 , as: "groups_roles"
    end 
    
    resources :books            , only: [:update, :edit]
    scope "/books" do
      match "/manage"           , to: "books#manage"                                , as: "books_manage"
      match "/update"           , to: "books#update"                                , as: "books_update"
      match "/roles"            , to: "books#roles"                                 , as: "books_roles"
    end 
    
    resources :authors
    resources :tags
    resources :settings
    resources :locations
  end
  
  resources :searches
  match "/search"							  , to: "searches#search"	                            , via: "get",       as: "search"
  
  
end

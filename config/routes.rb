Rails.application.routes.draw do
  

 
  
  # Recommendspots
  get 'recommendspots/index' => 'recommendspots#index'
  get "recommendspots/new" => "recommendspots#new"
  post "recommendspots/create" => "recommendspots#create"
  
  # Contacts
  get 'contacts/new' => "contacts#new"
  get "contacts/send" => "contacts#send"
  
  
  # Favorites
  # Favorites
  get 'favorites/:id/index' => 'favorites#index'
  post 'favorites/:id/create' => 'favorites#create'
  post "favorites/:id/destroy" => "favorites#destroy"
  
  
  # Chats
  get 'chats/:id/index' => 'chats#index'
  resources :chats, :only => [:show, :create]
  # get 'chats/:id' => 'chats#show'
  # post "chats/create" => "chats#create"
  
  
  # Comments
  get 'comments/:id/index' => 'comments#index'
  post 'comments/create' => 'comments#create'
  get "send" => "comments#send"
  
  
  # Firends
  get "friends/:id/index" => "friends#index"
  get "friends/:id/approval" => "friends#approval"
  get "friends/:id/wait" => "friends#wait"
  get "friends/:id/block" => "friends#block"
  post "friends/:id/create" => "friends#create"
  
  post "friends/:id/accept" => "friends#accept"
  get "friends/:id/request" => "friends#request"
  
  
  # Events
  get "events/index" => "events#index"
  get "events/new" => "events#new"
  get "events/:id" => "events#show"
  post "events/create" => "events#create"
  get  "events/:id/edit" => "events#edit"
  post "events/:id/update" => "events#update"
  post "events/:id/destroy" => "events#destroy"
  post "events/:id/piccreate" => "events#piccreate"
  # Users
  post "users/:id/update" => "users#update"
  get "users/:id/edit" => "users#edit"
  post "users/create" => "users#create"
  get "signup" => "users#new"
  get "users/index" => "users#index"
  get "users/:id" => "users#show"
  post "login" => "users#login"
  post "logout" => "users#logout"
  get "login" => "users#login_form"
  get "users/:id/likes" => "users#likes"
  get "users/:id/setupmenu" => "users#setupmenu"
  get "mail_send" => "users/mail_send"
  
  
  
  # Top
  get '/' => 'blogs#blogsindex'
  get "agreement" => "home#agreement"
  get "qa" => "home#qa"
  get "info" => "home#info"


 # Blogs
  get 'blogs/blogsindex' => 'blogs#blogsindex' 
  # ユーザー全体のブログ一覧
  get "blogs/new" => "blogs#new"
  get "blogs/:id" => "blogs#show"
  post "blogs/create" => "blogs#create"
  get "blogs/:id/edit" => "blogs#edit"
  post "blogs/:id/update" => "blogs#update"
  get "blogs/:id/draftindex" => "blogs#draftindex"
  get "blogs/:id/index" => "blogs#index"
  # ユーザー個人のブログ一覧
  


end

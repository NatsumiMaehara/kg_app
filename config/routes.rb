Rails.application.routes.draw do
  

 
  
  # Recommendspots
  get 'recommendspots/index' => 'recommendspots#index'
  
  
  # Contacts
  get 'contacts/new' => "contacts#new"
  get "contacts/send" => "contacts#send"
  
  
  # Favorites
  get 'favorites/:id/index' => 'favorites#index'
  
  
  
  # Chats
  get 'chats/:id/index' => 'chats#index'
  get 'chats/:id/show' => 'chats#show'
  
  
  # Comments
  get 'comments/index' => 'comments#index'
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
  post "events/:id/update" => "events#update"
  get "events/:id/edit" => "events#edit"
  get "events/index" => "events#index"
  get "events/new" => "events#new"
  get "events/:id" => "events#show"
  post "events/create" => "events#create"
  
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
  get "blogs/draftindex" => "blogs#draftindex"
  get "blogs/:id/index" => "blogs#index"
  # ユーザー個人のブログ一覧


end

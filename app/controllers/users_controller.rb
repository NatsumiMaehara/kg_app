class UsersController < ApplicationController
  
  before_action :authenticate_user, {only: [:index, :show, :edit, :update]}
  before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}
  before_action :ensure_correct_user, {only: [:edit,:update]}  
  
  
  def index
    @user = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(
      nickname: params[:nickname],
      email: params[:email],
      icon: "default_user.jpg",
      password: params[:password]
    )
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/new")
    end
  end
  
  def show
    @user = User.find_by(id: params[:id])
    logger.debug("-----------------params[:id] = #{params[:id]}")
  end
  
  def edit
    @user = User.find_by(id: params[:id])
  end
    
  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    
    if params[:image]
      @user.icon = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.icon}", image.read)
    end
    
    if @user.save
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/edit")
    end
  end
  
  def login_form
  end
   
   def login
     @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/blogs/index")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")
    end
   end
   
    def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login")
    end
  
  def mail_send
  end
  
    def ensure_correct_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to("/posts/index")
    end
  end
  
  
  
end

 # o:全員に公開
 # s:自分だけの日記
 # f:友達のみ公開
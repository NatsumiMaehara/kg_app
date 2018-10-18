class BlogsController < ApplicationController
  
  def blogsindex
    logger.debug("---------------------はじめまして")
    @blogs = Blog.all.order(created_at: :desc)
  end
  
  def index
    logger.debug("---------------------params[:id] = #{params[:id]} ")
    @blogs = Blog.where(user_id: params[:id])
  end
    
  def show
    # urlの末尾の数字がparams[:id]です
    @blog = Blog.find_by(id: params[:id])
    # 上のblogの１レコード内のuser_idのuserが@userです
    @user = @blog.user
    @comments = Comment.where(blog_id: @blog.id)
  end
  
  def new
  end
  
  def create
    @blog = Blog.new(
      content: params[:content],
      user_id: @current_user.id
      )
    @blog.save
    redirect_to("/blogs/blogsindex")
  end
  
  
  def edit
    @blog = Blog.find_by(id: params[:id])
  end
  
  def update
    @blog = Blog.find_by(id: params[:id])
    @blog.content = params[:content]
    if @blog.save
      flash[:notice] = "記事を編集しました"
      redirect_to("/blogs/index")
    else
      render("blogs/edit")
    end
    # タイトルの編集が入ってない
  end
  
  
  
  
  def draftindex
  end
  
end

  # 0:公開
  # 9:下書き
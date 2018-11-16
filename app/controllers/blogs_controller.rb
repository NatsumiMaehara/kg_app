class BlogsController < ApplicationController
  
  def blogsindex
    logger.debug("---------------------はじめまして")
    @blogs = Blog.all.order(created_at: :desc)
  end
  
  def index
    logger.debug("-------------------- index fff #{params[:id]}")
    @blogs = Blog.where(status: 0).where(user_id: params[:id])
  end
  
  def draftindex
    logger.debug("-------------------- draftindex #{@current_user.id}")
    @blogs = Blog.where(status: 9).where(user_id: params[:id])
  end
  
  def show
    # urlの末尾の数字がparams[:id]です
   if @blog = Blog.find_by(id: params[:id])
    # 上のblogの１レコード内のuser_idのuserが@userです
    @user = @blog.user
    @comments = Comment.where(blog_id: @blog.id)
   else
     render("/blogs/index")
   end
  end
  
  def new
  end
  
  def create
    logger.debug("======================== blog create @current_user.id = #{@current_user.id}")
    @blog = Blog.new(
      title: params[:title],
      content: params[:content],
      user_id: @current_user.id,
      status: params[:status].to_i
      )
      
    if @blog.save
       if @blog.status == 9
    logger.debug("======================== blogs_draftindex_path")
            redirect_to("/blogs/#{@current_user.id}/draftindex")
       else
            redirect_to("/blogs/#{@current_user.id}/index")
       end
    else
      render("blogs/new")
    end 
  end
  
  
  def edit
    @blog = Blog.find_by(id: params[:id])
  end
  
  def update
    @blog = Blog.find_by(id: params[:id])
    @blog.update(
      title: params[:title],
      content: params[:content]
      )
    if @blog.save
      flash[:notice] = "記事を編集しました"
      redirect_to("/blogs/index")
    else
      render("blogs/edit")
    end
    # タイトルの編集が入ってない
  end

end
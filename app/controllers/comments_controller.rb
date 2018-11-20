class CommentsController < ApplicationController
  def index
    @comments = Comment.where(user_id: @current_user.id)
    
    if @comments.present?
       @commentblogs = Blog.where(id: @comments.blog_id)
    else
      render("/comments/index")
    end
    
  end
  
  def create
    @comment = Comment.new(comment: params[:comment],
                           user_id: session[:user_id],
                           blog_id: params[:blog_id]
                           )
    if @comment.save
      flash[:notice] = "コメント登録したよ"
      redirect_to("/blogs/#{params[:blog_id]}")
    else
      render("blogs/#{params[:blog_id]}")
    end
  end
end

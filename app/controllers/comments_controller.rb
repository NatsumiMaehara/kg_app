class CommentsController < ApplicationController
  def index
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

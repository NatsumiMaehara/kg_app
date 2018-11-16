class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.where(user_id: @current_user.id)
    
    if @favorite.present?
       @favoriteblogs = Blog.where(id: @favorites.blog_id)
    else
       render("/favorites/index") 
    end
  end
  
  def create
    logger.debug("===================== blog.id = #{params[:id]}")
    @favorite = Favorite.new(blog_id: params[:id],
                             user_id: @current_user.id
                            )
    if @favorite.save
      flash[:notice] = "お気に入りに追加しました"
      redirect_to("/blogs/#{params[:id]}")
    else
      flash[:notice] = "お気に入りに追加できませんでした"
      redirect_to("/blogs/#{params[:id]}")
    end
  end
  
end
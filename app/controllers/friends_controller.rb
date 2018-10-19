class FriendsController < ApplicationController
  def index
    
  end
  
  def create
    logger.debug("------------------------friend controller params user_id =")
      
    @friend = Friend.new(follower: @current_user.id,
                         followed: params[:id]
                        )
    if  @friend.save
      flash[:notice] = "友達申請出しました"
      redirect_to("/users/#{params[:id]}")
    else
      render("users/#{params[:id]}")
    end
  end
  
  
  def accept
    logger.debug("------------------------accept params user_id = #{params[:id]}")
    @friend = Friend.new(follower: @current_user.id,
                         followed: params[:id]
                        )
    if  @friend.save
      flash[:notice] = "友達になりました"
      redirect_to("/users/#{params[:id]}")
    else
      render("users/#{params[:id]}")
    end
  end
 
  def approval
  end
  
  def wait
  end
  
  def block
  end
  
  # status
  # w:承認待ち
  # a:承認済み
  # b:ブロック
  
end

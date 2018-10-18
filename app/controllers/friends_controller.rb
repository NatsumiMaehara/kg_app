class FriendsController < ApplicationController
  def index
    
  end
  
  def create
    logger.debug("------------------------friend controller params user_id = #{params[:id]}")
      
    @friend = Friend.new(follower_id: @current_user.id,
                         followed_id: params[:id],
                        )
    if  @friend.save
      flash[:notice] = "友達申請出しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/#{@user.id}")
    end
  end
  
  
  def accept
    logger.debug("------------------------accept params user_id = #{params[:id]}")
  end
  
  def request
    # logger.debug("------------------------request params user_id")
    redirect_to("/users/index")

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

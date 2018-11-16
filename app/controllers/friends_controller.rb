class FriendsController < ApplicationController
  
  
  def index
      ## 初期化
       @both_friends = []  # すでに友達
       @req_friends = []   # 申請中
       
       @friends = Friend.where(follower: @current_user.id)
       @friends.each do |friend|
         
         if Friend.find_by(follower: friend.followed,
                           followed: @current_user.id
                          )
        # logger.debug("====================== friend = #{friend.followed}")

            @both_friends.push(friend)
            
         else
            @req_friends.push(friend)
         end
        end
    logger.debug("====================== @both_friends = #{@both_friends[0].followed}")
    logger.debug("====================== @both_friends = #{@both_friends[1].followed}")
    logger.debug("====================== @req_friends = #{@req_friends[0].followed}")
 
      ##  相手からの申請に対する承認まだ 初期化
       @wait_friends = []
         
        @friends = Friend.where(followed: @current_user.id) 
        @friends.each do |friend|
          if !Friend.find_by(follower: @current_user.id,
                             followed: friend.follower
                             )
                             
            @wait_friends.push(friend)
          end
        end
    logger.debug("====================== @wait_friends = #{@wait_friends[0].follower}")

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

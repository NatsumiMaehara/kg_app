class ChatsController < ApplicationController
  def index
    
  end
  
  def show
      
      @chats = Chat.where("(sender_id = ? and receiver_id = ?) OR (sender_id = ? and receiver_id = ?)",
                            @current_user.id,params[:id],params[:id],@current_user.id)
      @friend_id = params[:id]
      
  end
  
  def create
      @chat = Chat.new(
      message: params[:message],
      sender_id: @current_user.id,
      receiver_id: params[:receiver_id]
      )
      
    @chat.save
    redirect_to("/chats/#{params[:receiver_id]}")

       
  end
  
  def index
    @chats = Chat.where("(sender_id = ? ) OR (receiver_id = ?)",
                            @current_user.id,@current_user.id)
    @friends = @chats.find_all {|k,v| v !=  @current_user.id }
    @friend = @friends.to_h

  end
  
end

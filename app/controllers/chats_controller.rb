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
                            @current_user.id,@current_user.id).order(created_at: :desc)
    
    if @chats.present?
       friend_chat = []
       @chat_message = []
       
       @chats.each do |chat| 
           if chat.sender_id != @current_user.id
               if !friend_chat.include?(chat.sender_id)
                 friend_chat.push(chat.sender_id)
                 logger.debug("=========================== friend chat list 上 = #{chat.sender_id}..#{chat.message}")
                 @chat_message.push([chat.sender_id,chat.message])
               end
           else
               if  !friend_chat.include?(chat.receiver_id)
                 friend_chat.push(chat.receiver_id)
                 logger.debug("=========================== friend chat list 下 = #{chat.receiver_id}..#{chat.message}")
                 @chat_message.push([chat.receiver_id,chat.message])
               end
           end
         end
    end
       
       
       
        # @friends = @chats.find_all {|k,v| v !=  @current_user.id }
        # @friend = @friends.to_h

   end
  
end

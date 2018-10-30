class ChatsController < ApplicationController
  def index
    
  end
  
  def show
      
      @chats = Chat.where("(sender_id = ?,receiver_id = ?) OR (sender_id = ?,receiver_id = ?)",
                            current_user.id,params[:id],params[:id],current_user.id).order(created_at: :desc)

  end
  
  def create
     

       
  end
  
end

class EventsController < ApplicationController
  def index
    @events = Event.all.order(created_at: :desc)
  end
  
  def show
    @events = Event.find_by(id: params[:id])
  end
  
  
  def new
  end
  
  def create
    @event = Event.new(title: params[:title],
                       content: params[:content],
                       target: params[:target],
                       event_date: params[:event_date],
                       event_start: params[:event_start],
                       place: params[:place]
                       )
    @event.save
    redirect_to("/events/index")
  end
  
  def edit
    @event = Event.find_by(id: params[:id])
  end
  
  def update
   @event = Event.find_by(id: params[:id])
   @event.title = params[:title]
   @event.content = params[:content]
    
  #   if params[:image]
  #     @user.icon = "#{@user.id}.jpg"
  #     image = params[:image]
  #     File.binwrite("public/user_images/#{@user.icon}", image.read)
  #   end
    
  #   if @user.save
  #     flash[:notice] = "ユーザー情報を編集しました"
  #     redirect_to("/users/#{@user.id}")
  #   else
  #     render("users/edit")
  #   end 
  end

  
end

class EventsController < ApplicationController
  def index
    @events = Event.all.order(created_at: :desc)
  end
  
  def show
    @events = Event.find_by(id: params[:id])
    @user = User.find_by(id: @events.user_id)
    @event_pics = Eventpic.where(event_id: @events.id)
    # logger.debug(@event_pics.inspect)
  end
  
  
  def new
    @event = Event.new
  end
  
  def create
    require 'fileutils'
    # logger.debug("--------------------------file_name=#{params[:post][:file_name]}")
    
    @event = Event.new(event_params)
    
    if @event.save
        event_id = Event.last.id

      
          # 画像のアップロード対応
    
          if params[:images]
             save_flag = false
             cnt = 0
             params[:images].each { |image|
             
              @event_pics = Eventpic.new(event_pics_params)
              @event_pics.event_id = event_id
              
              if image.inspect.include?("jpg")
                @event_pics.file_type = "jpg"
              elsif image.inspect.include?("jpeg")
                @event_pics.file_type = "jpeg"
              elsif image.inspect.include?("png")
                @event_pics.file_type = "png"
              elsif image.inspect.include?("mp4")
                @event_pics.file_type = "mp4"
              elsif image.inspect.include?("mov")
                @event_pics.file_type = "mov"
              elsif image.inspect.include?("m4v")
                @event_pics.file_type = "m4v"
              end
              
              logger.debug("--------------------------file_name= #{image.inspect.include?("jpg")}")
              
              dir_path = "public/pics/#{post_id}"
              FileUtils.mkdir_p(dir_path) unless FileTest.exist?(dir_path)
              
              @event_pics.file_name = "#{@event.id}-#{cnt+1}.#{@event_pics.file_type}"
              image = params[:images][cnt]
              File.binwrite("public/pics/#{event_id}/#{@event_pics.file_name}", image.read)
              cnt += 1
              
              @event_pics.save
              save_flag = true
             }
          
              if save_flag
                flash[:notice] = "イベントを作成しました"
                redirect_to events_index_path
              else 
                render events_new_path
              end
          end
      
      
    else
      render events_new_path
    end
      
  end
  
  
  
  def edit
    @event = Event.find_by(id: params[:id])
  end
  
  
  def update 
   @event = Event.find_by(id: params[:id])
   @event.update(
                 title: params[:title],
                 content: params[:content],
                 target: params[:target],
                 event_date: params[:event_date],
                 event_start: params[:event_start],
                 place: params[:place]
                 )
     if @event.save
        redirect_to("/events/index")
     else
        render("event/edit")
     end 
  
  
  def piccreate
    @event = Event.find_by(id: params[:id])
    @eventpic = Eventpic.new(
                             event_id: @event.id,
                             pic: params[:pic]
                             )
  end
 
  end
  
  def destroy
    @event = Event.find_by(id: params[:id])
   if  @event.destroy
     redirect_to("/events/index")
   end
  end

  private 
    def event_params
      params.require(:event).permit(:title, :target, :event_date, :event_start, :place, :price, :user_id, :content).merge(:user_id => @current_user.id)
    end
    
    def event_pics_params
      params.require(:event).permit(:pic)
    end
  
end

class EventsController < ApplicationController
  def index
    @events = Event.all.order(created_at: :desc)
  end
  
  def show
    @events = Event.find_by(id: params[:id])
    @user = User.find_by(id: @events.user_id)
  end
  
  
  def new
    @event = Event.new
  end
  
  def create
    require 'fileutils'
    # logger.debug("--------------------------file_name=#{params[:post][:file_name]}")
    
    @post = Post.new(post_params)
    
    if @post.save
        post_id = Post.last.id

      
          # 画像のアップロード対応
    
          if params[:images]
             save_flag = false
             cnt = 0
             params[:images].each { |image|
             
              @post_detail = PostDetail.new(post_detail_params)
              @post_detail.post_id = post_id
              
              if image.inspect.include?("jpg")
                @post_detail.file_type = "jpg"
              elsif image.inspect.include?("jpeg")
                @post_detail.file_type = "jpeg"
              elsif image.inspect.include?("png")
                @post_detail.file_type = "png"
              elsif image.inspect.include?("mp4")
                @post_detail.file_type = "mp4"
              elsif image.inspect.include?("mov")
                @post_detail.file_type = "mov"
              elsif image.inspect.include?("m4v")
                @post_detail.file_type = "m4v"
              end
              
              logger.debug("--------------------------file_name= #{image.inspect.include?("jpg")}")
              
              dir_path = "public/pics/#{post_id}"
              FileUtils.mkdir_p(dir_path) unless FileTest.exist?(dir_path)
              
              @post_detail.file_name = "#{@post.id}-#{cnt+1}.#{@post_detail.file_type}"
              image = params[:images][cnt]
              File.binwrite("public/pics/#{post_id}/#{@post_detail.file_name}", image.read)
              cnt += 1
              
              @post_detail.save
              save_flag = true
             }
          
              if save_flag
                flash[:notice] = "success save detail"
                redirect_to posts_path
              else 
                render new_post_path
              end
          end
      
      
    else
      render new_post_path
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
    def post_params
      params.require(:event).permit(:title, :target, :event_date, :event_start, :place, :price, :user_id, :content).merge(:user_id => @current_user.id)
    end
    
    def post_detail_params
      params.require(:event).permit(:file_name)
    end
  
end

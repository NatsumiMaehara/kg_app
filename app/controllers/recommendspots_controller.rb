class RecommendspotsController < ApplicationController
  def index
  end
  
  def new
  end
  
  def create
    @recommendspot = Recommendspots.new(
                                        spot_name: params[:spot_name],
                                        detail: params[:detail],
                                        user_comment: params[:user_comment],
                                        user_id: @current_user.id,
                                        )
     @recommendspot.save
    # この後の処理
  end

end

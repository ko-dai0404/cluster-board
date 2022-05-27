class RoomsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :move_to_index, except: [:index, :new, :create]

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    room = Room.find(params[:id])
    if room.update(room_params)
      redirect_to root_path
    else
      render :edit
    end
  end



  private

  def room_params
    params.require(:room).permit(:image, :room_name, :category_id, :content).merge(user_id: current_user.id)
  end

  def move_to_index
    @room = Room.find(params[:id])
    redirect_to action: :index unless current_user.id == @room.user_id
  end

end

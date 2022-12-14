class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @room = Room.find(params[:booking][:room_id])
    @booking = Booking.new(booking_params)
    @days = (@booking.end_date - @booking.start_date).to_i
    @booking.total_price = (@room.fee * @booking.person * @days).to_i
    @booking.user_id = current_user.id
    @booking.room_id = @room.id
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id
    if @booking.save
      flash[:notice] = "新規予約を作成しました"
      redirect_to booking_path(@booking)
    else 
      flash[:notice] = "新規予約に失敗しました"
      @room = Room.find(params[:booking][:room_id])
      @days = (@booking.end_date - @booking_start_date).to_i
      @booking.total_price = (@room.fee * @booking.person * @days).to_i
      @booking.user_id = current_user.id
      @booking.room_id = @room.id
      render "new"
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @room = @booking.room 
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :person, :total_price, :room_id, :user_id )
  end
end

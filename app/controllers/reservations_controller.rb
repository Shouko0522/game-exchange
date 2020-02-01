class ReservationsController < ApplicationController
  def index
    @reservation = Reservation.all
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @game = Game.find(params[:game_id])
    @reservation = Reservation.new
  end

  def reservation_dashboard
    @reservations = current_user.reservations
  end

  def create
    @reservation = Reservation.new(reservation_params)
    game = Game.find(params[:game_id])
    user = current_user
    @reservation.game = game
    @reservation.user = user
    @reservation.status = "pending"
    @reservation.save
    redirect_to game_path(game)
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    @reservation.update(reservation_status_params)

    redirect_to reservation_path(@reservation)
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end

  def reservation_status_params
    params.require(:reservation).permit(:status)
  end

end

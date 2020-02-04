class GamesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
    @reservation = Reservation.new
  end

  def new
    @game = Game.new

  end

  def dashboard
    @games = current_user.games
  end

  def xbox
    @games = Game.where("platform LIKE 'Xbox%'")
    # query = SELECT * FROM games WHERE platform = "Xbox"
    # @games = ActiveRecord::Base.connection.execute(query)
  end

  def ps4
    @games = Game.where("platform LIKE 'PS4%'")
  end

  def switch
    @games = Game.where("platform LIKE 'Nintendo%'")
  end

  def create
    @game = Game.new(game_params)
    @game.user = current_user
    if @game.save
      redirect_to game_path(@game), notice: 'Game was successfully created'
    else
      render 'new'
    end
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      redirect_to @game, notice: 'Game was successfully updated'
    else
      render 'edit'
    end
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to @game, notice: 'Game was successfully destroyed'
  end

  private

  def game_params
    params.require(:game).permit(:name, :price, :platform, :photo)
  end
end

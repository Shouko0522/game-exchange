class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
    @review = Review.new
  end

  def new
    @game = Game.new
  end

  def dashboard
    @games = current_user.games
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

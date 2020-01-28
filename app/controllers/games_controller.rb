class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def dashboard
    @games = current_user.games
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to @game, notice: 'Game was successfully created'
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
    @game = Game.fnd(params[:id])
    @game.destroy
    redirect_to @game, notice: 'Game was successfully destoryed'
  end

  private

  def game_params
    params.require(:game).permit(:name, :price, :platform)
  end
end

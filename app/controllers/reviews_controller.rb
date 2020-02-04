class ReviewsController < ApplicationController
def show

end
  def create
    @review = Review.new(review_params)
    @game = Game.find(params[:game_id])
    @review.game = @game
    if @review.save
      redirect_to game_path(@game), notice: 'Nice review!!'
    else
      render 'games/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end

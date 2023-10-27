class CommentsController < ApplicationController
  def create
    @car = Car.find(params[:car_id])
    @comment = @car.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to car_path(@car), notice: 'Comment was successfully created.'
    else
      render 'cars/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
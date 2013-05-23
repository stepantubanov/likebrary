class RatingsController < ApplicationController
  def update
    rating = Rating.where(rating_attributes).first || Rating.new(rating_attributes)

    rating.value = params[:rating][:value]
    rating.save!

    redirect_to root_path
  end

  private

  def rating_attributes
    { user_id: params[:id], book_id: params[:book_id] }
  end
end

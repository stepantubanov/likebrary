class RatingsController < ApplicationController
  before_filter :authenticate_user!

  def update
    rating = Rating.for(rating_attributes)

    rating.value = params[:rating][:value]
    rating.save!

    redirect_to :back
  end

  private

  def rating_attributes
    { user_id: params[:id], book_id: params[:book_id] }
  end
end

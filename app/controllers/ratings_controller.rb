class RatingsController < ApplicationController
  before_filter :authenticate_user!

  rescue_from RatingAuthorization::NotAuthorizedError do
    render status: :unauthorized, text: 'Permission denied'
  end

  def update
    rating = Rating.for(rating_attributes)

    authorization = RatingAuthorization.new(rating, current_user)
    authorization.request!

    rating.value = params[:rating][:value]
    rating.save!

    redirect_to :back
  rescue ActionController::RedirectBackError
    redirect_to root_path
  end

  private

  def rating_attributes
    { user_id: params[:id], book_id: params[:book_id] }
  end
end

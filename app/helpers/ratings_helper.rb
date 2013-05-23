module RatingsHelper
  def rating_title(rating)
    current_user == rating.user ? "your rating" : rating.user.email
  end
end

module RatingsHelper
  def rating_title(rating)
    current_user == rating.user ? "Your rating" : rating.user.email
  end
end

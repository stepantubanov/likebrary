class RatingAuthorization
  class NotAuthorizedError < StandardError
  end

  def initialize(rating, user)
    @rating = rating
    @user = user
  end

  def request
    @user.admin? or @user == @rating.user
  end

  def request!
    request or raise NotAuthorizedError
  end
end

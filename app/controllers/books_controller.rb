class BooksController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create]

  def new
    @book = Book.new
    @book.ratings.build(user: current_user)
  end

  def create
    @book = Book.new(book_params)

    # TODO: would be better done with a form object
    if @book.ratings.present?
      @book.ratings.first.user = current_user
    end

    if @book.save
      redirect_to books_path, notice: "Thanks for adding #{@book.title} to our collection"
    else
      render :new
    end
  end

  def index
    @books = Book.includes(ratings: :user).page(params[:page]).per(10)

    if current_user
      @books.each do |book|
        unless book.rating_by(current_user)
          book.ratings.build(user: current_user)
        end
      end
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :isbn, ratings_attributes: [:value])
  end
end

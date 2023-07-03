class BooksController < ApplicationController
  def index
    @books = Book.includes(:author).all
  end
end

class User::BooksController < ApplicationController

  def index
    @books = Book.published
  end
end

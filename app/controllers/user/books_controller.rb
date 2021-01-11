class User::BooksController < UserController

  def index
    @books = Book.published
  end

  def show
    @book = Book.find(params[:id])
  end

  def inventory
    @orders = current_user.orders.approved
    @orders_pending = current_user.orders.pending
  end
end

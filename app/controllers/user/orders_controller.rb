class User::OrdersController < UserController
  before_action :set_book
  def create
    order = current_user.orders.create(book: @book)
    if order.present?
      flash[:notice] = "Order created sucessfully"
      redirect_to user_books_path
    else
    end

    # def show
    # # @books = Book.find(params[:id])
    # end
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end
end

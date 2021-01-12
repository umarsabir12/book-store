
class Admin::BooksController < AdminController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = current_admin.books.create(permitted_params)
    if @book.present?
      flash[:notice] = "Book created successfully."
      redirect_to admin_book_path(@book)
    else
      flash[:notice] = "Error"
      redirect_to new_admin_book_path
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(permitted_params)
    flash[:notice] = "Book Updated successfully."
    redirect_to admin_book_path(@book)
  end

  def publish
    @book = Book.find(params[:id])
    @book.update_attribute(:published, true)
    flash[:notice] = "Book published successfully."
    redirect_to admin_book_path(@book)
  end

  def unpublish
    @book = Book.find(params[:id])
    @book.update_attribute(:published, false)
    flash[:notice] = "Book unpublished successfully."
    redirect_to admin_book_path(@book)
  end

  def destroy
    @book = Book.destroy(params[:id])
    flash[:notice] = "Book deleted succesfully " if @book.destroy
    redirect_to admin_books_path
  end
  private

  def permitted_params
    params.require(:book).permit(:title, :author, :amount, :description, :picture, :published)
  end
end

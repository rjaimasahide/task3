class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book_new = Book.new(book_params)
    @book_new.user_id = current_user.id
    if @book_new.save
       redirect_to book_path(@book_new.id)
       flash[:notice] = "successfully"
    else
      @book_all = Book.all
       render :index
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def update
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
    if @book.update(book_params)
       redirect_to book_path(@book.id)
       flash[:notice] = "successfully"
    else
       render :edit
    end
  end

  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
  end

  def index
    @book_new = Book.new
    @book_all = Book.all
  end

  def edit
    @book = Book.find(params[:id])
     unless @book.user == current_user
      redirect_to books_path
     end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end

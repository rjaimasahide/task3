class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def create
    @book_new = Book.new(book_params)
    @book_new.user_id = current_user.id
    if @book_new.save
       redirect_to books_path
    else
      @book_all = Book.all
       render :index
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
    @book.destroy
    redirect_to books_path
  end

  def update
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
    @book.update(book_params)
    redirect_to books_path
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
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end

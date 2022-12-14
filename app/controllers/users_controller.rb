class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
      if @user.update(user_params)
         redirect_to user_path
         flash[:notice] = "successfully"
      else
         render :edit
      end
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book_new = Book.new
  end

  def create
    render template: "books/create"
  end

  def index
    @book_new = Book.new
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end

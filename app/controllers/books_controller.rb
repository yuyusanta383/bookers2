class BooksController < ApplicationController
 before_action :authenticate_user!
  def show
   @book = Book.new
   @book_find = Book.find(params[:id])
   @user = @book_find.user
  end

  def index
   @book = Book.new
   @books =Book.all
   @user = current_user
  end

  def new
    @book = Book.new
  end

  def edit
   @book_find =Book.find(params[:id])
   if @book_find.user ==current_user
    render "edit"
   else
    redirect_to books_path
   end
  end

  def create
    @user = current_user
    @book = Book.new(book_params)
    @books =Book.all
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
    else
      render :index
    end
  end

  def update
   @book_find = Book.find(params[:id])
   if @book_find.update(book_params)
   flash[:notice] = "You have updated book successfully."
   redirect_to book_path(@book_find)
   else
    render :edit
   end
  end
  def destroy
   @book_find = Book.find(params[:id])
   @user = @book_find.user
   @book_find.destroy
   redirect_to books_path
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end


class UsersController < ApplicationController
 before_action :authenticate_user!
 before_action :correct_user, only: [:edit]


 def show
  @user =User.find(params[:id])
  @books = @user.books
  @book = Book.new
 end

 def index
  @users = User.all
  @user = current_user
  @book = Book.new
 end

 def edit
 @user = User.find(params[:id])

 end


 def create

 end

 def update
  @user = User.find(params[:id])
  if @user.update(user_params)
   flash[:notice] = "You have updated user successfully."
   redirect_to user_path(@user)
  else
   render :edit
  end
 end
 def destroy
 end

 private
  def correct_user
   @user = User.find(params[:id])
   if @user != current_user
    redirect_to user_path(current_user)
   end
  end

 def user_params
  params.require(:user).permit(:name, :introduction, :profile_image)
 end
end





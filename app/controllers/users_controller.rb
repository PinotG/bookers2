class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]

  def index
    #@user = User.find(params[:id])
    #@books = @user.books.page(params[:page])
    @book = Book.new
    @user = current_user
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  #  @books = @user.books.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
    else
      @user = current_user
      @users = User.all
      render:index
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully"
      redirect_to user_path(@user.id)
    else
      render:edit
    end  
  end
  
   private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction, :user_id)
  end
  
  def correct_user
    @user = User.find(params[:id])
    unless @user == current_user
    redirect_to user_path(current_user)
    end
  end
end

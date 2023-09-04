class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.first
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      # session[:user_id] = @user.id

      flash[:notice] = "User created"
      redirect_to users_path, notice: "User created"
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :surname, :email, :password, :password_confirmation)
  end
end

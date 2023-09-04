class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if find_and_check_user(user)
      session[:user_id] = user.id

      redirect_to root_path, notice: 'Logged in successfully'
    else
      flash.now[:alert] = 'Invalid email or password'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil

    redirect_to root_path, notice: 'Logged Out'
  end

  private

  def find_and_check_user(user)
    user.present? && user.authenticate(params[:password])
  end
end

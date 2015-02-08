class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.user_id
      redirect_to movies_path, notice: "Welcome back, #{user.firstname}!"
    else
      flash.now[:notice] = "Log in failed..."
      render :new
    end
  end
end

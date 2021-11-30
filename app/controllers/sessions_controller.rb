class SessionsController < ApplicationController
  def new
  end

  def create
    email = [:session][:email].downcase
    password = [:session][:password]
    if login(emial, password)
      flash[:success] = ""
      redirect_to root_path
    else
      flash.now[:danger] = ""
      render "new"
    end
  end

  def destroy
  end

  private
  def login(email, password)
    @user = User.find_by(email: email)
    if @user && @user.authenticate(password)
      session[:user_id] = @user.id
      return true
    else
      return false
    end
  end
end

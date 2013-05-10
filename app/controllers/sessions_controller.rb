class SessionsController < ApplicationController
  def new

  end

  def create
    u = User.find_by_email(params[:email])
    if u && u.authenticate(params[:password])
      session[:user_id] = u.id
      redirect_to users_url, notice: "Welcome to Rojo #{u.name}!"

    else
      redirect_to new_session_url, notice: "Your credentials were not accepted. Please try again."
    end

  end

  def destroy
    reset_session
    redirect_to users_url

  end
end

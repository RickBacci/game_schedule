class SessionsController < ApplicationController

  def create
    reset_session

    session[:user_id] = user.id if user

    if current_user
      flash[:notice] = "Welcome #{current_user.name}"
      redirect_to root_path
    else
      flash[:error] = 'There was a problem with your login'
      redirect_to root_path
    end
  end

  def destroy
    reset_session

    flash[:notice]    = 'You have successfully logged out.'
    redirect_to root_path
  end

  private

  def user
    User.from_omniauth(request.env['omniauth.auth'])
  end
end

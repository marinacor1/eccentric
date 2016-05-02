class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:Username])
    byebug
    if @user && @user.authenticate(params[:session][:Password])
      session[:user_id] = @user.id
      redirect_to packages_path
      # if current_user.admin?
      #   redirect_to admin_dashboard_path
      # else
      #   redirect_to packages_path
      # end
    else
      flash[:alert] = "Incorrect email/ password combination."
      redirect_to login_path
    end
  end
end

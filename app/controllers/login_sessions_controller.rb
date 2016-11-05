class LoginSessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:session][:name].downcase)
    if user && user.authenticate(params[:session][:password])
      flash[:secondary] = "Welcome back!"
      log_doctor(user)
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_back_or(user)

    else
      flash.now[:alert] = 'Sorry! Invalid name/password combination'
      render 'new'
    end

  end

  def destroy
    doctor_out if logged_doctor?
    redirect_to(root_path)
  end
end

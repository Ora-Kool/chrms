class ManagerSessionsController < ApplicationController
  def new
  end

  def create
    manager = Manager.find_by(name: params[:session][:name].downcase)
    if manager && manager.authenticate(params[:session][:password])
      flash[:secondary] = "Welcome back!"
      log_manager(manager)
      #params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_back_or(manager)

    else
      flash.now[:alert] = 'Sorry! Invalid name/password combination'
      render 'new'
    end

  end

  def destroy
    manager_out if logged_manager?
    redirect_to(root_path)
  end
end

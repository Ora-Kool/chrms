class ManagerSessionsController < ApplicationController
  def new
  end

  def create
    manager = Manager.find_by(name: params[:session][:name].downcase)
    role = Manager.find_by(hospital_id: params[:session][:hospital_id])
    if manager && manager.authenticate(params[:session][:password])  && role
      log_manager(manager)
      params[:session][:remember_me] == '1' ? remember(manager) : forget(manager)
      redirect_to manager_dashboard_path

    else
      flash.now[:warning] = 'Access denied'
      render 'new'
    end

  end

  def destroy
    manager_out if logged_manager?
    redirect_to(root_path)
  end
end

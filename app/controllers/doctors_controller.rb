class DoctorsController < ApplicationController
	before_action :logged_in_doctor, only: [:show]
  def show
  end



  private
  def logged_in_doctor
  	unless logged_doctor?
   		flash[:warning] = "Access denied!"
   		redirect_to login_panel_path
   	end
  end
end

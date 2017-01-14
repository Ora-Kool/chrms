class ManagerController < ApplicationController
  before_action :set_cache_headers, only: [:show, :new_doctor, :create_doctor]
	before_action :logged_in_manager, only: [:show, :new_doctor, :create_doctor,
		:new_staff, :create_staff]
  def show
    @hospitals = Hospital.all
    @doctors = Doctor.all
    @staffs = Staff.all
  end

  def new_doctor
    @doctor = Doctor.new
  end

  def create_doctor
    @doctor = Doctor.new(doctors_params)
    @doctor.hospital_id = current_manager.hospital.id
    @doctor.password = "chrms"
    @doctor.password_confirmation  = "chrms"

    #@doctor.city = current_manager.hospital.hospital_city
    if @doctor.save
        flash[:secondary] = "Dr. #{@doctor.name} account was added successfully."
        redirect_to manager_dashboard_path
    else
       render "new_doctor"
    end

  end
  def new_staff
    @staff = Staff.new
  end

  def create_staff
    @staff = Staff.new(staffs_params)
    @staff.hospital_id = current_manager.hospital.id
    if @staff.save
        flash[:secondary] = "Staff successfully added"
        redirect_to manager_dashboard_path
    else
       render 'new_staff'
    end
  end


  private

  def doctors_params
    params.require(:doctor).permit(:name, :email)
  end

  def staffs_params
    params.require(:staff).permit(:name, :password, :password_confirmation, :email)
  end

  def logged_in_manager
   	unless logged_manager?
   		flash[:warning] = "Access denied!"
   		redirect_to root_path
   	end
  end

  def set_cache_headers
    response.headers["Cache-Control"] = "no-cache, no-store"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end
end

class PasswordResetsController < ApplicationController
	before_action :get_doctor, only: [:edit, :update]
	before_action :valid_doctor, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update]

  def new
  end

  def create
  	@doctor = Doctor.find_by(email: params[:password_reset][:email].downcase)
  	if @doctor
  		@doctor.create_reset_digest
  		@doctor.send_password_reset_email(@doctor)
  		flash[:info] = "Email sent with password reset instructions"
  		 redirect_to login_panel_path
  		else
  			flash.now[:warning] = "Email address not found"
  			render "new"
  	end
  end

  def edit
  end
  def update
    if params[:doctor][:password].empty?
        @doctor.errors.add(:password, "can't be empty")
        render 'edit'
    elsif @doctor.update_attributes(doctor_params)
      log_doctor(@doctor)
       @doctor.update_attribute(:reset_digest, nil)
      flash[:secondary] = "Password has been reset."
      redirect_to doctor_dashboard_path
    else
        render 'edit'
    end
  end

  private

  def doctor_params
    params.require(:doctor).permit(:password, :password_confirmation)    
  end
   def get_doctor
   	 @doctor = Doctor.find_by(email: params[:email])
   end

   	#confirms a valid doctor in the system
   def valid_doctor
   	#unless (@doctor && @doctor.activated? && @doctor.authenticated?(:reset, params[:id]))
   		#redirect_to login_panel_path 		
   #	end
   	unless (@doctor && @doctor.authenticated?(:reset, params[:id]))
   		redirect_to login_panel_path
   	end
   end

   #check  expiration  of reset token
   def check_expiration
     if @doctor.password_reset_expired?
      flash[:warning] = "Password reset has expired."
      redirect_to new_password_reset_url
    end
   end
end

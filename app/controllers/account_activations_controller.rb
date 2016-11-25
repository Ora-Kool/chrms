class AccountActivationsController < ApplicationController
	def edit
    doctor = Doctor.find_by(email: params[:email])
      if doctor && !doctor.activated? && doctor.authenticated?(:activation, params[:id])
        doctor.activate
        log_doctor(doctor)
        flash[:secondary] = "Account activated!"
        redirect_to doctor_dashboard_path
      else
        flash[:warning] = "Invalid activation link"
        redirect_to root_url
      end
    end
end

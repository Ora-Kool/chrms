class LoginSessionsController < ApplicationController
  def new
  end

  def create
    doctor = Doctor.find_by(name: params[:session][:name].downcase)
    hospital = Doctor.find_by(hospital_id: params[:session][:hospital_id])

    if doctor && doctor.authenticate(params[:session][:password]) && hospital

      #if doctor.activated?
          log_doctor(doctor)
          params[:session][:remember_me] == '1' ? remember(doctor) : forget(doctor)
          redirect_to doctor_dashboard_path
      #else
         # message = "Account not activated. "
          #message += "Check your email for the activation link."
          #flash[:warning] = message
          #redirect_to root_path
      #end

    else
      flash.now[:warning] = t('.errors')
      render 'new'
    end

  end

  def destroy
    doctor_out if logged_doctor?
    redirect_to(root_path)
  end
end

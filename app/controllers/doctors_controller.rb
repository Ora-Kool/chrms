class DoctorsController < ApplicationController
  before_action :set_cache_headers, only: [:show, :edit, :update]
  before_action :find_doctor, only: [:incomplete, :create_referral,
                                     :incomplete_update, :edit, :update]

	before_action :logged_in_doctor, only: [:show, :request_referral,
                                          :create_referral, :referral_confirmation,
                                          :edit, :incomplete, :incomplete_update, :hospitals]

  before_action :correct_doctor, only: [:edit, :update, :show,:request_referral,
                                          :create_referral, :referral_confirmation,
                                          :edit, :incomplete, :incomplete_update, :hospitals]
  def show
    if (current_doctor.surname.nil? || current_doctor.given_names.nil? || current_doctor.email.nil? || current_doctor.mobile_number.nil?)
      redirect_to  doctor_dashboard_incomplete_path(current_doctor.name)
    
    elsif params[:search]
        @referrals = ReferralForm.search(params[:search], current_doctor.name).order("created_at DESC")
       else
        @referrals = ReferralForm.my_referrals(current_doctor.name).order("created_at DESC")
      end

  end

  def incomplete
    #@doctor = Doctor.find_by(name: params[:name])
  end

  def incomplete_update
    #@doctor = Doctor.find_by(name: params[:name])

    if @doctor.update_attributes(doctor_update)
      flash[:secondary] = "Welcome onboard, we hope you enjoy using our services"
      redirect_to doctor_dashboard_path
    else
      render 'incomplete'
    end
  end

  def edit
    #@doctor = Doctor.find_by(name: params[:name])
  end

  def update
    if @doctor.update_attributes(doctor_update)
      flash[:secondary] = "Thanks for updating your profile"
      redirect_to doctor_dashboard_path
    else
      render 'edit'
    end
  end

  
  def request_referral
    @referral = ReferralForm.new
    @referred_doctor = Doctor.find(params[:id])
  end

  def create_referral
    @referral = ReferralForm.new(referrals_params)
    @referred_doctor = Doctor.find(params[:id])
    
    @referral.doctors_name = "#{current_doctor.surname}"
    @referral.signature = current_doctor.name
    if @referral.save
      flash[:secondary] = "Your request has being submitted"
      redirect_to doctor_dashboard_request_referral_confirmation_path(@referral)
    else
      render "request_referral"
    end
  end

  def referral_confirmation
    @referral = Referral.find(params[:id])
  end

  def patients
    @patients = Referral.my_referrals(current_doctor.name)
  end

  def hospitals
    @doctors = Doctor.all
  end



  private

  def referrals_params
    params.require(:referral_forms).permit(:type_of_referral,
                                           :initiating_facility_name,
                                           :patient_contact,
                                           :date_of_referral,
                                           :referring_doctors_name,
                                           :referring_doctors_speciality,
                                           :referring_doctors_mobile_number,
                                           :patient_full_names,
                                           :patient_identity_number,
                                           :patient_age,
                                           :patient_gender,
                                           :patient_address,
                                           :patient_mobile_number,
                                           :patient_clinical_history,
                                           :findings,
                                           :treatment_given,
                                           :reasons_for_referral,
                                           :referred_facility_name,
                                           :address_of_referred_facility,
                                           :optional_message)
  end

  def doctor_update
    params.require(:doctor).permit(:photo,
                                   :surname,
                                   :first_name,
                                   :last_name,
                                   :gender,
                                   :given_names,  
                                   :id_card_number,
                                   :education,
                                   :educational_summary,
                                   :speciality,
                                   :country,
                                   :region,
                                   :mobile_number,
                                   :mobile_number2,
                                   :email)
  end

  def logged_in_doctor
  	unless logged_doctor?
   		flash[:warning] = "Access denied!"
   		redirect_to login_panel_doctors_login_path
   	end
  end
  #confirming the correct user of the accessing page
  def correct_doctor
    @doctor = current_doctor
    redirect_to login_panel_doctors_login_path  unless current_doctor?(@doctor)
  end

  def set_cache_headers
    response.headers["Cache-Control"] = "no-cache, no-store"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end

  def find_doctor
        @doctor = Doctor.find_by(name: params[:name])
  end
end

class DoctorsController < ApplicationController
	before_action :logged_in_doctor, only: [:show, :request_referral,
                                          :create_referral, :referral_confirmation]
  before_action :current
  def show
    #@referrals = Referral.my_referrals(current_doctor).order("created_at DESC")
    @referrals = Referral.my_referrals(current_doctor.name)
   # if params[:search]
     # @referrals = Referral.search(params[:search]).order("created_at DESC")
    #else
     # @referrals = Referral.my_referrals(current_doctor).order("created_at DESC")
   # end
  end

  def request_referral
    @referral = Referral.new
  end

  def create_referral
    @referral = Referral.new(referrals_params)
    @referral.doctors_name = "#{current_doctor.surname} #{current_doctor.first_name} #{current_doctor.last_name}"
    if @referral.save
      flash[:secondary] = "Your request has being submitted"
      redirect_to chrms_doctors_dashboard_request_referral_referral_confirmation_path(@referral)
    else
      render "request_referral"
    end
  end

  def referral_confirmation
    @referral = Referral.find_by(id: params[:referral_id])
  end



  private

  def referrals_params
    params.require(:referral).permit(:patientID, :patient_full_names,
                                     :patient_contact, :referral_type,
                                     :reasons_for_referrals,
                                     :referred_doctor,
                                     :referred_hospital_name,
                                     :signature)
  end

  def logged_in_doctor
  	unless logged_doctor?
   		flash[:warning] = "Access denied!"
   		redirect_to login_panel_path
   	end
  end
  def current
    current_doctor
  end
end

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
        @results = ReferralForm.search(params[:search], "#{current_doctor.surname} #{current_doctor.given_names}").order("created_at DESC").paginate(page: params[:page], per_page: 6)
        @mades = ReferralForm.total_referrals_made_by_current_doctor("#{current_doctor.surname} #{current_doctor.given_names}")
       else
        @referrals = ReferralForm.my_referrals("#{current_doctor.surname} #{current_doctor.given_names}").order("created_at DESC").paginate(page: params[:page], per_page: 6)
        @mades = ReferralForm.total_referrals_made_by_current_doctor("#{current_doctor.surname} #{current_doctor.given_names}")

      end

  end

  def incomplete
    #@doctor = Doctor.find_by(name: params[:name])
  end

  def incomplete_update
    #@doctor = Doctor.find_by(name: params[:name])

    if @doctor.update_attributes(doctor_update)
      #DoctorMailer.account_activation(@doctor).deliver_now
      @doctor.send_activation_email
      #flash[:secondary] = "Welcome onboard, we hope you enjoy using our services"
      flash[:alert] = "Please check your email to activate your account."
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
     @referred_doctor = Doctor.find(params[:id])
    @referral = ReferralForm.new
   
  end

  def create_referral
    @referred_doctor = Doctor.find(params[:id])

    @referral = ReferralForm.new(referrals_params)

    @referral.referred_facility_doctors_name = "#{@referred_doctor.surname} #{@referred_doctor.given_names}"
    @referral.initiating_facility_name = current_doctor.hospital.hospital_name
    @referral.date_of_referral = Date.today
    @referral.referring_doctors_name = "#{current_doctor.surname} #{current_doctor.given_names}"
    @referral.referring_doctors_speciality = current_doctor.speciality
    @referral.referring_doctors_mobile_number = current_doctor.mobile_number
    @referral.referred_facility_name = @referred_doctor.hospital.hospital_name
    @referral.address_of_referred_facility = current_doctor.hospital.hospital_address
    @referral.patient_token = token(6, @referral.patient_full_names)

    if @referral.save
      @referral.update_pending
      flash[:secondary] = "Your request has being submitted"
      redirect_to doctor_dashboard_request_referral_confirmation_path(@referral)
    else
      render "request_referral"
    end
  end

  def referral_confirmation
    @referral = ReferralForm.find(params[:id])
  end

  def total_referrals_made
    if params[:search2]
      @referrals = ReferralForm.search(params[:search2], "#{current_doctor.surname} #{current_doctor.given_names}").order("created_at DESC").paginate(page: params[:page], per_page: 6)
      @mades = ReferralForm.total_referrals_made_by_current_doctor("#{current_doctor.surname} #{current_doctor.given_names}")

    else
      @referrals = ReferralForm.total_referrals_made_by_current_doctor("#{current_doctor.surname} #{current_doctor.given_names}")
      @mades = ReferralForm.total_referrals_made_by_current_doctor("#{current_doctor.surname} #{current_doctor.given_names}")

    end

  end

  def patients
    @patients = ReferralForm.my_referrals("#{current_doctor.surname} #{current_doctor.given_names}")
  end

  def read_referral
    @patient = ReferralForm.find(params[:id])
    if @patient.referral_status == "pending"
          @patient.update_received
    end
  end

  def referral_back_slip
     @patient = ReferralForm.find(params[:id])
     @patient_referral_back_slip = ReferralBackSlip.new
  end
  def submit_referral_back_slip
     @patient = ReferralForm.find(params[:id])

     @patient_referral_back_slip = ReferralBackSlip.new(referral_back_slip_params)
     @patient_referral_back_slip.received_facility_name = @patient.referred_facility_name
     @patient_referral_back_slip.received_doctors_number = current_doctor.mobile_number
     @patient_referral_back_slip.doctor_replying_names = "#{current_doctor.surname} #{current_doctor.given_names}"
     @patient_referral_back_slip.doctors_speciality = current_doctor.speciality
     @patient_referral_back_slip.replying_date = Date.today
     @patient_referral_back_slip.initiated_facility_name = @patient.initiating_facility_name
     @patient_referral_back_slip.initiated_facility_address = @patient.initiating_facility_address
     @patient_referral_back_slip.patient_identity_number = @patient.patient_identity_number
     @patient_referral_back_slip.patient_age = @patient.patient_age
     @patient_referral_back_slip.patient_gender = @patient.patient_gender
     @patient_referral_back_slip.patient_address = @patient.patient_address
     @patient_referral_back_slip.refer_back_to = @patient.referring_doctors_name
     @patient_referral_back_slip.patient_full_names = @patient.patient_full_names


     if @patient_referral_back_slip.save
         @patient.update_completed
        flash[:secondary] = "Thanks for sending #{@patient.patient_full_names} back for follow up"
        redirect_to doctor_dashboard_path
     else
        render 'referral_back_slip'
     end
  end

  def submitted_back_slips
      @patient = ReferralBackSlip.find_by(patient_identity_number: params[:id])
      @back_slips = ReferralBackSlip.where(patient_identity_number: params[:id])
  end

  def hospitals
    if params[:hospital].blank?
      @doctors = Doctor.all.paginate(page: params[:page], per_page: 6)
    else
      @hospital_id = Hospital.find_by(hospital_name: params[:hospital])
      @doctors = Doctor.where(hospital_id: @hospital_id).paginate(page: params[:page], per_page: 6)
    end
    
  end



  private

  def referrals_params
    params.require(:referral_form).permit(:type_of_referral,                                        
                                           :initiating_facility_address,                            
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
                                   :city,
                                   :educational_summary,
                                   :speciality,
                                   :country,
                                   :region,
                                   :mobile_number,
                                   :mobile_number2,
                                   :email)
  end

  def referral_back_slip_params
    params.require(:referral_back_slip).permit(:patient_was_seen_by,
                                               :special_investigation,
                                               :special_findings,
                                               :diagnosis,
                                               :treatments,
                                               :operation,
                                               :medications_prescribed,
                                               :please_continue_with,
                                               :patient_full_names,
                                               :referral_back_slip_message)
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

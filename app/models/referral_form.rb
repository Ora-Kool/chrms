class ReferralForm < ApplicationRecord
		validates 	:type_of_referral, presence: true
    	validates	:initiating_facility_name, presence: true
    	validates	:date_of_referral, presence: true
    	validates	:referring_doctors_name, presence: true
    	validates	:referring_doctors_speciality, presence: true
    	validates	:referring_doctors_mobile_number, presence: true
    	validates	:patient_full_names, presence: true
    	validates	:patient_identity_number, presence: true
    	validates	:patient_age, presence: true
    	validates	:patient_gender, presence: true
    	validates	:patient_address, presence: true
    	validates	:patient_mobile_number, presence: true
    	validates	:patient_clinical_history, presence: true
    	validates	:findings, presence: true
    	validates	:treatment_given, presence: true
    	validates	:reasons_for_referral, presence: true
    	validates	:referred_facility_name, presence: true
    	validates	:address_of_referred_facility, presence: true
    	validates	:optional_message, presence: false


	def self.search(keyword, doctor)
		where("patient_identity_number LIKE ? AND referring_doctors_name = ?", "%#{keyword}%", "#{doctor}")
	end
	def self.my_referrals(current_user)
		where("referring_doctors_name LIKE ?", "%#{current_user}%")
	end

    def update_pending

        update_attribute(:referral_status, "pending")
    end

    def update_received
        update_attribute(:referral_status, "received")
    end

    def update_completed
        update_attribute(:referral_status, "completed")
    end
end

class ReferralForm < ApplicationRecord
  		validates 	:type_of_referral, presence: true
      validates	:initiating_facility_name, presence: true
      validates   :initiating_facility_address, presence: true
      validates	:date_of_referral, presence: true
    	validates	:referring_doctors_name, presence: true
    	validates	:referring_doctors_speciality, presence: true
    	validates	:referring_doctors_mobile_number, presence: true
    	validates	:patient_full_names, presence: true
    	validates	:patient_age, presence: true
    	validates	:patient_gender, presence: true
    	validates	:patient_address, presence: true
    	validates :patient_token, presence: true
    	validates	:patient_clinical_history, presence: true
    	validates	:findings, presence: true
    	validates	:treatment_given, presence: true
    	validates	:reasons_for_referral, presence: true
    	validates	:referred_facility_name, presence: true
    	validates	:address_of_referred_facility, presence: true
      validates   :optional_message, presence: false
    	validates	:referred_facility_doctors_name, presence: true

      VALID_ID_CARD_REGEX = /\d\d\d\d\d\d\d\d\d/

      validate :validate_phone

      validates   :patient_identity_number, presence: true, length: {minimum: 9, maximum: 9},
                                        format: { with: VALID_ID_CARD_REGEX, message: 'is invalid'}

      before_save {
        self.patient_full_names = capitalize_name(patient_full_names)
      }

      
        




	def self.search(token, doctor_id)
    string = doctor_id.to_i
    where("patient_token  ?", "%#{token}%")
	end
	def self.my_referrals(current_user)
		where("referred_facility_doctors_name LIKE ?", "%#{current_user}%")
	end
    def self.total_referrals_made_by_current_doctor(current_doctor)
        where("referring_doctors_name LIKE ?", "%#{current_doctor}%")
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

    def self.count_current_referrals
        ReferralForm.count
    end
   
    private
    def validate_phone
     phone = patient_mobile_number
     if phone.nil?
      errors.add(:patient_mobile_number, "can't be empty")
    elsif phone == referring_doctors_mobile_number
      errors.add(:patient_mobile_number, "has being taken")
     elsif phone[0, 1].to_i >= 5 && phone[0, 1] != "" && phone.length == 9 && isnumeric?(phone)
       self.patient_mobile_number = patient_mobile_number
      elsif phone.length < 9
        errors.add(:patient_mobile_number, 'should be 9 digits')
     else
      errors.add(:patient_mobile_number, 'is invalid')
     end
   end

   def isnumeric?(object)
      true if Integer(object) rescue false
   end
   def token(size = 6)
      charset = %w{ 2 3 4 6 7 9 A B C D E F G H I J K  L M N O P Q R S T U V W X Y Z }
      (0...size).map{ charset.to_a[rand(charset.size)] }.join
    end
    
end

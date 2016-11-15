class Referral < ApplicationRecord
	#belongs_to :doctors
	validates :patientID, presence: true
	validates :patient_full_names, presence: true
	
	validates :referral_type, presence: true
	validates :reasons_for_referrals, presence: true
	validates :referred_doctor, presence: true
	validates :referred_hospital_name, presence: true
	validates :signature, presence: true

	validates :patient_contact, phone: { possible: false, allow_blank: true, types: [:mobile] }



	def self.search(search1, current_doctor_name)
    	where("patientID LIKE ? AND referred_doctor LIKE ?", "%#{search1}%", "%#{current_doctor_name}%")
  	end

  	def self.my_referrals(all)
  		where("referred_doctor LIKE ?","%#{all}%")
  	end

  	def self.referrals(signature)
  		where("signature LIKE ?", "%#{signature}%")
  	end

  
end

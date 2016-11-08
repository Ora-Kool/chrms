class Referral < ApplicationRecord
	validates :patientID, presence: true
	validates :patient_full_names, presence: true
	validates :patient_contact, presence: true
	validates :referral_type, presence: true
	validates :reasons_for_referrals, presence: true
	validates :referred_doctor, presence: true
	validates :referred_hospital_name, presence: true
	validates :signature, presence: true



	def self.search(search)
    where("patientID LIKE ? OR patient_full_names LIKE ?", "%#{search}%", "%#{search}%")
  	end

  	def self.my_referrals(search)
  		where("signature LIKE ?", "%#{search}%")
  	end
end

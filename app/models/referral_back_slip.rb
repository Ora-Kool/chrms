class ReferralBackSlip < ApplicationRecord
		validates :patient_was_seen_by, presence: true
    	validates :special_investigation, presence: true
    	validates :special_findings, presence: true
    	validates :diagnosis, presence: true
    	validates :treatments, presence: true
    	validates :operation, presence: true
    	validates :medications_prescribed, presence: true
    	validates :please_continue_with, presence: true
    	validates :referral_back_slip_message, presence: false
end

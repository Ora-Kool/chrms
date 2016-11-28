class Message < ApplicationRecord
	validates :name, presence: true
	validates :subject, presence: true
	validates :content, presence: true, length: { maximum: 256 }
end

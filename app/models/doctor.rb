class Doctor < ApplicationRecord
	belongs_to :hospital
	attr_accessor :remember_token
	validates :name, presence: true

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  	validates :email, presence: false, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }, allow_nil: true

    before_save {
    	if email == '' || email.nil?

    	else
    		self.email = email.downcase
    	end
     

      }

    has_secure_password
  	validates :password, presence: true, length: { minimum: 6 }, allow_nil: true


  	# Returns the hash digest of the given string.
  def Doctor.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  #this method returns a random user token
  def Doctor.new_token
    SecureRandom.urlsafe_base64
  end

  #this instance method helps to remember a user in the database
  def remember
    self.remember_token = Doctor.new_token
    update_attribute(:remember_digest, Doctor.digest(remember_token))
  end

  #check if a given token matches that stored one and return true else false
  def authenticated?(remmber_token)
    BCrypt::Password.new(remember_digest).is_password?(remmber_token)
  end

  #forget a user when logged out
  def forget
    update_attribute(:remember_digest, nil)
  end
end

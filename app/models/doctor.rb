class Doctor < ApplicationRecord
	belongs_to :hospital
  #has_many :referrals
	attr_accessor :remember_token
  validates :name, presence: true
  validates :given_names, presence: true, allow_nil: true
  validates :surname, presence: true, allow_nil: true
  validates :country, presence: true, allow_nil: true
  validates :region, presence: true, allow_nil: true
  validates :gender, presence: true, allow_nil: true
  validates :education, presence: true, allow_nil: true
  validates :speciality, presence: true, allow_nil: true
  validates :educational_summary, presence: true, allow_nil: true
  validate  :validate_phone1

  before_save { self.name = name.downcase }

  
  validates :mobile_number2, phone: { possible: false, allow_blank: true, types: [:mobile] },
                                                  allow_nil: true
  

  VALID_ID_CARD_REGEX = /\d\d\d\d\d\d\d\d\d/

  validates :id_card_number, presence: true, length: {minimum: 9, maximum: 9},
                                        format: {with: VALID_ID_CARD_REGEX, message: 'is invalid'},
                                        uniqueness: true, allow_nil: true

   



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

      
    has_attached_file :photo, styles: {large: "600x600>", medium: "300x300>", thumbnail: "100x100>" }, default_url: "/images/doctor.jpg"
    validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/

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

  def self.search(search)
    where("name LIKE ? OR email LIKE ?", "%#{search}%", "%#{search}%")
  end

  private
   def validate_phone1
     phone = mobile_number
     if phone.nil?
      self.mobile_number = mobile_number
     elsif phone[0, 1].to_i >= 5 && phone[0, 1] != "" && phone.length == 9 && isnumeric?(phone)
       self.mobile_number = mobile_number

      elsif phone.length < 9
        errors.add(:mobile_number, 'should have not less than 9 digits')
     else
      errors.add(:mobile_number, 'is invalid')
     end
   end

   def validate_phone2
     phone2 = mobile_number2
     if phone2.nil?
      self.mobile_number2 = nil
     elsif phone2[0, 1].to_i >= 5 && phone2[0, 1] != "" && phone2.length == 9 && isnumeric?(phone2)
       self.mobile_number2 = mobile_number2
     else
      self.mobile_number2 = nil
     end
   end

   def isnumeric?(object)
      true if Integer(object) rescue false
   end


   
   
end

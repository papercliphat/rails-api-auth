require 'securerandom'

class User < ActiveRecord::Base

	has_many :active_user_names
	has_many :user_names, through: :active_user_names

	before_create :generate_auth_token
	validates :auth_token, uniqueness: true

	before_save { self.email = email.downcase }
	

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 150 },
						format: { with: VALID_EMAIL_REGEX },
						uniqueness: { case_sensitive: false }

	has_secure_password
	validates :password, presence: true, length: { in: 6..50 }

	

		def generate_auth_token
			begin
				self.auth_token = SecureRandom.hex
			end while self.class.exists?(auth_token: auth_token)
		end
end
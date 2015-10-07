class UserName < ActiveRecord::Base
	has_many :active_user_names
	has_many :users, through: :active_user_names

	validates :user_name, presence: true, length: { in: 6..50 }
	
end

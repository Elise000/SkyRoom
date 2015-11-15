class User < ActiveRecord::Base
	has_secure_password
	has_many :listings, dependent: :destroy
	has_many :bookings

	mount_uploader :avatar, AvatarUploader

  validates :username, presence: true
  validates :email, presence: true, uniqueness: true,
    format: {with: /\A[^@\s]+@([^@\s]+\.)+[^@\W]+\z/ }

	def self.from_omniauth(auth)
	  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
	    user.provider = auth.provider 
	    user.uid      = auth.uid
	    user.username = auth.info.name
	    user.fbpic		= auth.info.image
	    user.email		= auth.info.email
	    user.password = SecureRandom.hex
	    user.save!
	  end
	end

end
    

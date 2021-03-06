class User < ActiveRecord::Base

  belongs_to :team, autosave: true
  belongs_to :role, autosave: true
  has_many :events, autosave: true

  accepts_nested_attributes_for :events

  after_save do
  	self.events.each do |e|
  		e.role_id = role_id
  		e.team_id = team_id 
  		e.save
  	end
  end

  
  #Relationships for MICROPOSTS
  has_many :microposts, dependent: :destroy
  

  #Relationships for FOLLOWED_UERS
  has_many :relationships, 			foreign_key: 	"follower_id",
  									dependent: 		:destroy

  has_many :followed_users, through: :relationships, source: :followed

  
  #Relationships for FOLLOWERS
  has_many :reverse_relationships, 	foreign_key: 	"followed_id",
  									class_name: 	"Relationship", 
  									dependent: 		:destroy

  has_many :followers, through: :reverse_relationships, source: :follower


	before_save { self.email = email.downcase }
	before_create :create_remember_token

	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
		validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
						  uniqueness: { case_sensitive: false }

	has_secure_password
	validates :password, length: { minimum: 6 }, :if => :password

	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	def feed
	Micropost.where("user_id = ?", id)
	end

	#*** BEGIN code for Following ***

	def following?(other_user)
		relationships.find_by(followed_id: other_user.id)
	end

	def follow!(other_user)
		relationships.create!(followed_id: other_user.id)
	end

	def unfollow!(other_user)
		relationships.find_by(followed_id: other_user.id).destroy!
	end

	#*** END code for Following ***

private
		
		def create_remember_token
			self.remember_token = User.encrypt(User.new_remember_token)
		end
end

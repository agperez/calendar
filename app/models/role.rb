class Role < ActiveRecord::Base
	has_many :events, autosave: true
	has_many :users, autosave: true 
end

class Cabinet < ActiveRecord::Base
	has_many :foods
	#validates :name, presence: true
	
end

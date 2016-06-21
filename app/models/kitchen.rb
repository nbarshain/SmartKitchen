class Kitchen < ActiveRecord::Base
	has_many :cabinets
	# has_many :cabinets
	# validates :name, presence: true
end

class Kitchen < ActiveRecord::Base
	has_many :cabinets, dependent: destroy
	# has_many :cabinets
	# validates :name, presence: true
end

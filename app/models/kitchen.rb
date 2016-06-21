class Kitchen < ActiveRecord::Base
	has_many :cabinets, dependent: :destroy
	validates :name, presence: true
end

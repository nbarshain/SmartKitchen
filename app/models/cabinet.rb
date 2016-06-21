class Cabinet < ActiveRecord::Base
	#has_many :foods, dependent: destroy
	has_many :foods
	#belongs_to :kitchen
	#validates :name, presence: true

end

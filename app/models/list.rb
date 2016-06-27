class List < ActiveRecord::Base
	has_many :foods, dependent: :destroy
	belongs_to :kitchen
	validates :name, presence: true
end

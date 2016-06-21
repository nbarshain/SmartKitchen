class Food < ActiveRecord::Base
	belongs_to :cabinet
	validates :name, presence: true 
end

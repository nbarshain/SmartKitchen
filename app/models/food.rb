class Food < ActiveRecord::Base
	belongs_to :cabinet
	belongs_to :list
	validates :name, presence: true 
end

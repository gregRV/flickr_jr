class Album < ActiveRecord::Base
	belongs_to :user
	has_many :photos

	validates :name, presence: true
end

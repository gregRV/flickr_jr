class Photo < ActiveRecord::Base
	belongs_to :album
	mount_uploader :file, Uploader

	validates :file, presence: true
end

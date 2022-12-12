class Room < ApplicationRecord
  mount_uploader :room_image, ImageUploader
  belongs_to :user
  has_many :bookings, dependent: :destroy
end

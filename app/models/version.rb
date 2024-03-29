class Version < ApplicationRecord
  belongs_to :project
  has_many :comments
  has_one :color_swatch

  mount_uploader :photo, PhotoUploader
end

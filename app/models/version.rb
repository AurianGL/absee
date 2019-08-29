class Version < ApplicationRecord
  belongs_to :project
  has_many :comments
  has_one :color_swatch

  mount_uploader :work_in_progress, PhotoUploader

end

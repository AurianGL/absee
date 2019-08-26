class Comment < ApplicationRecord
  mount_uploader :image, PhotoUploader

  belongs_to :version
  belongs_to :user
end

class Comment < ApplicationRecord
  belongs_to :version
  belongs_to :user

  mount_uploader :image, ImageUploader
end

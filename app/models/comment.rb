class Comment < ApplicationRecord
  belongs_to :version
  belongs_to :user
end

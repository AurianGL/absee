class ColorSwatch < ApplicationRecord
  belongs_to :version
  belongs_to :artist_as, class_name: 'User'
end

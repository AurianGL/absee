class ColorSwatch < ApplicationRecord
  belongs_to :version
  belongs_to :artist, class_name: 'User'
end

class Project < ApplicationRecord
  belongs_to :customer, foreign_key: :customer_id, class_name: 'User'
  belongs_to :artist, foreign_key: :artist_id, class_name: 'User', optional: true
  has_many :versions, dependent: :destroy
  has_many :comments, through: :versions

  # TO DO: Créer une methode de classe pour retourner la dernière version du projet

  validates :name, presence: true
  validates :brief, presence: true

  scope :as_customer, ->(customer_id) { where(customer: User.find(customer_id)) }
  scope :as_artist, ->(artist_id) { where(artist: User.find(artist_id)) }
end

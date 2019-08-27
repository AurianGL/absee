class Project < ApplicationRecord
  belongs_to :customer, class_name: 'User'
  belongs_to :artist, class_name: 'User'
  has_many :versions

  # TO DO: Créer une methode de classe pour retourner la dernière version du projet

  validates :name, presence: true
  validates :brief, presence: true
end

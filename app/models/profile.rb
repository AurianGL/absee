class Profile < ApplicationRecord
  CUSTOMERS = ["customer", "artist"]
  belongs_to :user
end

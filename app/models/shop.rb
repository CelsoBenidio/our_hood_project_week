class Shop < ApplicationRecord
  validates :name, presence: true
  validates :owner_name, presence: true
  validates :description, presence: true
  validates :email, presence: true
end

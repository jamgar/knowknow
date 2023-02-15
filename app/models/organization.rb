class Organization < ApplicationRecord
  has_many :users

  validates :name, presence: true, uniqueness: true
  validates :subdomain, presence: true

  accepts_nested_attributes_for :users
end

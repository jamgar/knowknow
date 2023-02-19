class SavedTemplate < ApplicationRecord
  acts_as_tenant :organization

  has_rich_text :content

  validates :title, presence: true
end

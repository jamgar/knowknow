class Note < ApplicationRecord
  belongs_to :user
  has_rich_text :content

  validates :title, presence: true, length: { maximum: 50 }
end

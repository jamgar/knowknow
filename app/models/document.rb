class Document < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  acts_as_tenant :organization
  belongs_to :user
  has_rich_text :content

  has_one :action_text_rich_text,
    class_name: 'ActionText::RichText',
    as: :record

  validates :title, presence: true, length: { maximum: 50 }
end

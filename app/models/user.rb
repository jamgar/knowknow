class User < ApplicationRecord
  acts_as_tenant(:organization)
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :role, { standard: 0, manager: 1, admin: 2 }

  belongs_to :organization
  has_many :notes
  has_many :documents
end

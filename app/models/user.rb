class User < ApplicationRecord
  has_secure_password
  has_many :articles
  has_many :categories

  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /\w{2,}\@\w+\.\w{2,3}/, message: "only allows valid emails" }
  validates :name, presence: true
  validates :name, length: { minimum: 2 }
end

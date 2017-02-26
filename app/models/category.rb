class Category < ApplicationRecord
  has_many :article_categories
  has_many :articles, through: :article_categories
  belongs_to :user

  validates :name, uniqueness: true
  validates :name, presence: true
end

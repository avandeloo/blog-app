class Article < ApplicationRecord
  belongs_to :user
  has_many :article_categories
  has_many :categories, through: :article_categories

  validates :title, presence: true
  validates :text, presence: true
  validates :text, length: { in: 200..500 }

end

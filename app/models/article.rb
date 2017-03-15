class Article < ApplicationRecord
  validates :title, presence: true
  validates :subtitle, presence: true, length: { maximum: 250 }
  validates :body, presence: true
  has_many :comments, dependent: :destroy
end

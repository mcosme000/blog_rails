class Article < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  validates :title, presence: true, length: { minimum: 6, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10 }
end

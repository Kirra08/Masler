class Article < ApplicationRecord
  belongs_to user
  belongs_to body_part_genre
  belongs_to gear_genre
  has_many article_comments, dependent: :destroy
  has_many favorites, dependent: :destroy

  validates :title, presence: true
  validates :text, length: {maximum: 500}
  validates :article_genre, presence: true
  validates :body_part_genre, presence: true
  validates :gear_genre, presence: true
end

class BodyPartGenre < ApplicationRecord
  has_many :articles, dependent: :destroy

  has_one_attached :body_part_icon

  validates :name, presence: true
  validates :body_part_icon, presence: true
end

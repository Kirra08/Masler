class BodyPartGenre < ApplicationRecord
  has_many :articles, dependent: :destroy

  has_one_attached :body_part_icon

  validates :name, presence: true
end

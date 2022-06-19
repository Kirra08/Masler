class GearGenre < ApplicationRecord
  has_many :articles, dependent: :destroy

  has_one_attached :gear_genre_icon

  validates :name, presence: true


end

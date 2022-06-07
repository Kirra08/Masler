class BodyPartGenre < ApplicationRecord
  has_many :articles, dependent: :destroy

  validates :name, presences: true
end

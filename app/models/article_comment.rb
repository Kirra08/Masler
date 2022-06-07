class ArticleComment < ApplicationRecord
  belongs_to user
  belongs_to article

  validates :title, presences: true
  validates :comment, presences: true
end

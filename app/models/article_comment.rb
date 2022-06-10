class ArticleComment < ApplicationRecord
  belongs_to :user
  belongs_to :article

  validates :title, presence: true
  validates :comment, presence: true
end

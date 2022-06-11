class Article < ApplicationRecord
  belongs_to :user
  belongs_to :body_part_genre
  belongs_to :gear_genre
  has_many :article_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_one_attached :article_image

  validates :title, presence: true
  validates :text, length: {maximum: 500}
  validates :body_part_genre, presence: true
  validates :gear_genre, presence: true

  def get_article_image(width, height)
    unless article_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      article_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpg')
    end
    article_image.variant(resize_to_limit: [width, height]).processed
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end

class Article < ApplicationRecord
  belongs_to :user
  belongs_to :body_part_genre
  belongs_to :gear_genre
  has_many :article_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :calenders

  has_one_attached :article_image
  has_one_attached :article_image2
  has_one_attached :article_image3
  has_one_attached :article_image4

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

  def gear_genre_icon(name)
    if name == "ダンベル"
      "fas fa-dumbbell"
    else if name == "バーベル"
      "fas fa-dumbbell"
    else name == "自重"
      "fas fa-user"
    end
  end

  def Article.looks(search, word)
    if search == "完全一致"
      @article = Article.where("title LIKE?", "#{word}")
    elsif search == "曖昧検索"
      @article = Article.where("title LIKE?", "%#{word}%")
    else
      @article = Article.all
    end
  end
  end
end

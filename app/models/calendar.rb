class Calendar < ApplicationRecord
  belongs_to :user
  belongs_to :article

  validates :weight, presence: true
  validates :set, numericality: {only_integer: true, greater_than_or_equal_to: 1}
  validates :rep, numericality: {only_integer: true, greater_than_or_equal_to: 1}
end

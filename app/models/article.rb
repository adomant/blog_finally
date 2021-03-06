class Article < ApplicationRecord

  acts_as_votable

  mount_uploader :image, ImageUploader

  belongs_to :user
  belongs_to :category, optional: true
  has_many :comments

  scope :moderated, -> { where('articles.moderation = true')}

  validates :text, presence: true, length: { minimum: 123 }
  validates :title, presence: true
  validates :image, presence: true
end

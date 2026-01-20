class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image
  has_rich_text :content

  validates :title, :content, :user_id, presence: true
end

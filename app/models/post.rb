class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :author, class_name: :User
  after_save :update_post_counter

  validates :title, length: 1..250, presence: true, allow_blank: false
  validates :comments_counter, numericality: { only_integer: true, greater_than: -1 }
  validates :likes_counter, numericality: { only_integer: true, greater_than: -1 }

  def recent_comments
    comments.limit(5).order(created_at: :desc)
  end

  private

  def update_post_counter
    author.increment!(:posts_counter)
  end
end

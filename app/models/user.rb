class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many :likes, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :posts, foreign_key: :author_id

  validates :name, presence: true, allow_blank: false
  validates :posts_counter, numericality: { only_integer: true, greater_than: -1 }

  def recent_posts
    posts.limit(3).order(created_at: :desc)
  end

  def admin?(requested_role)
    role == requested_role.to_s
  end
end

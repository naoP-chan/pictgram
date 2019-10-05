class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 15}
  validates :email, presence: true, format: { with: /\A.+@.+\..+\z/}
  # 良く使われるformatは以下　/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :password, length: { in: 8..32 }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,32}+\z/}
  
  has_secure_password
  
  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
  has_many :comments
  has_many :comment_topics, through: :comments, source: 'topic'
end

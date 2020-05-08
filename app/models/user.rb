class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #for fb sign in --> :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :follows

  has_many :follower_relationship, foreign_key: :following_id, class_name: 'Follow'
  has_many :followers, through: :follower_relationship, source: :follower

  has_many :following_relationship, foreign_key: :user_id, class_name: 'Follow'
  has_many :following, through: :following_relationship, source: :following
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #for fb sign in --> :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

class Follow < ApplicationRecord
  belongs_to :follower, foreign_key: 'spotter_id', class_name: 'spotter'
  belongs_to :following, foreign_key: 'following_id', class_name: 'spotter'
end

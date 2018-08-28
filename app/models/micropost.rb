class Micropost < ApplicationRecord
  belongs_to :user
  
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
  
  has_many :reverses_of_post_rel, class_name: 'PostRel'
  has_many :liked, through: :reverses_of_post_rel, source: :user
end

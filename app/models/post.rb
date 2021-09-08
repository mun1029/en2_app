class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :favorites
  has_many :favorite_users, through: :favorites, source: :user
  
  
  with_options presence: true do
    validates :title
    validates :text
    validates :l_cate_id
    validates :m_cate_id
    validates :s_cate_id
  end
end

class Post < ApplicationRecord
  belongs_to :user
  belongs_to_active_hash :s_cate
  has_many :favorites
  has_many :favorite_users, through: :favorites, source: :user
  
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :l_cate
    belongs_to_active_hash :m_cate

  with_options presence: true do
    validates :title
    validates :text
    validates :l_cate_id
    validates :m_cate_id
    validates :s_cate_id
  end
end

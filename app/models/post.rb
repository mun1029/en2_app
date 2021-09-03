class Post < ApplicationRecord
belongs_to :user
has_many :favorites
has_many :favorite_users, through: :favorites, source: :user
belongs_to_active_hash :l_cate
belongs_to_active_hash :m_cate
belongs_to_active_hash :s_cate

with_options presence: true do
  validates :title
  validates :text
  #  セキリュティ上のことを考えcateにもpresenceを適用させてます、不要と思ったら消してもらっても大丈夫です。
  validates :l_cate_id
  validates :m_cate_id
  validates :s_cate_id
  # //
end
end

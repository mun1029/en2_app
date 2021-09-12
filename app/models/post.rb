class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  
  with_options presence: true do
    validates :title
    validates :text
  end

  def self.search_keyword(keyword)
    Post.where('title LIKE(?) OR text LIKE(?)', "%#{keyword}%", "%#{keyword}%")
  end
end

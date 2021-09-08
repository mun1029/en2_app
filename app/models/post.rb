class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  
  with_options presence: true do
    validates :title
    validates :text
  end
end

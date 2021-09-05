class M_cate < ActiveHash::Base
  self.data = [
    { id: 101, name: '--' },
    { id: 201, name: '--' },
    { id: 301, name: '--' },
    { id: 401, name: '--' },
    { id: 501, name: '--' },
    { id: 601, name: '--' },
    { id: 701, name: '--' },
  ]

  include ActiveHash::Associations
  has_many :posts
end
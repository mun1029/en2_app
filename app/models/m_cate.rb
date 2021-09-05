class M_cate < ActiveHash::Base
  self.data = [
    { id: 101, name: 'Ruby'},{ id: 102, name: 'HTML・CSS'},{ id: 103, name: 'python'},
    { id: 104, name: 'Java'},{ id: 105, name: 'JavaScript'},
    { id: 201, name: 'Ruby on Rails'},{ id: 202, name: 'BootStrap'},{ id: 203, name: 'Django'},
    { id: 204, name: 'Spring'},
    { id: 301, name: 'VSコード'},{ id: 302, name: 'Atom'},{ id: 303, name: 'メモ帳'}
    { id: 401, name: 'Heroku'},{ id: 402, name: 'AWS'},
    { id: 501, name: 'Git'},
    { id: 601, name: 'MySQL'},
    { id: 701, name: 'その他'},
   
  ]

  include ActiveHash::Associations
  has_many :posts
end
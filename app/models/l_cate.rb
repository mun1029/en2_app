class L_cate < ActiveHash::Base
  self.data = [
    { id: 1, name: '言語' },
    { id: 2, name: 'フレームワーク' },
    { id: 3, name: 'テキストエディタ' },
    { id: 4, name: 'デプロイ' },
    { id: 5, name: 'ソースコード管理' },
    { id: 6, name: 'データーベース' },
    { id: 7, name: 'IT用語' },
  ]

  include ActiveHash::Associations
    has_many :posts
end

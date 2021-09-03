## 要件定義

# アプリケーション名
  **en2_app**(エンジニアエンジンアプリ)

# アプリケーション概要
  このアプリケーションはエンジニアによるエンジニアのための学習支援アプリです。

# 解決したい課題
  - TwitterとQittaの中間に位置する学習アウトプットツールがない
  - メソッドや変数命名などをする際にスペル確認を容易にしたい
  - 今まで学習した内容を辞書のようにまとめておきたい
  - Dockerを仕様したチーム開発を経験したい

# 共同開発者
  wakachico(https://github.com/wakachico),  
  mun1029(https://github.com/mun1029)

# 開発環境
  - ruby,HTML,CSS,JavaScript
  - ruby on rails,jquery
  - MySQL
  - Git,GitHub,Docker
  - AWS(EC2)

# ページ構成
  - ログインページ（devise/sessions#new）
  - 新規アカウント作成ページ(devise/registrations#new)
  - マイページ(user#show,post#destroy)
  - トップページ(post#index,root_path)
  - 投稿ページ(post#new,#create)
  - 投稿編集ページ(post#edit,#update)
  - 投稿詳細ページ(post#show)

# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| nickname           | string  | null: false               |

### Association

- has_many :posts
- has_many :favorites
- has_many :favorite_words, through: :favorites, source: :post

## posts テーブル 

| Column              | Type          | Options                         |
| ------------------- | ------------- | ------------------------------- |
| title               | string        | null: false                     |
| l_cate_id           | integer       | null: false                     |
| m_cate_id           | integer       | null: false                     |
| s_cate_id           | integer       | null: false                     |
| text                | text          | null: false                     |
| user                | references    | null: false, foreign_key: true  |

### Association

- belongs_to :
- has_many :favorites
- has_many :favorite_users, through: :favorites, source: :user
- belongs_to_active_hash  :l_cate
- belongs_to_active_hash  :m_cate
- belongs_to_active_hash  :s_cate

## favorites テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| post       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :post
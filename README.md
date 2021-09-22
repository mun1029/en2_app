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

# 本番環境URL
  http://3.132.225.16:3000/

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

# 機能紹介
## ユーザ管理機能
  担当：wakachico  
  内容：ユーザ新規登録、ログイン、ログアウト
  [![Image from Gyazo](https://i.gyazo.com/1890921dc5455e1a0ff48f6574e423f0.gif)](https://gyazo.com/1890921dc5455e1a0ff48f6574e423f0)

## 記事投稿機能
  担当：mun1029 , help:wakachico   
  内容：記事の投稿、マークダウンテキスト、マークダウンショートカットボタン、テキストリアルタイムプレビュー、多階層カテゴリー選択
  [![Image from Gyazo](https://i.gyazo.com/4517d01c8c6f52010262675400f1d89d.gif)](https://gyazo.com/4517d01c8c6f52010262675400f1d89d)

## 記事編集機能
  担当：mun1029   
  内容：記事の投稿、マークダウンテキスト、マークダウンショートカットボタン、テキストリアルタイムプレビュー、多階層カテゴリー選択
  [![Image from Gyazo](https://i.gyazo.com/03657f4c472e27ab1bf26db135fd61a5.gif)](https://gyazo.com/03657f4c472e27ab1bf26db135fd61a5)

## 記事削除機能
  担当：wakachico   
  内容：投稿したユーザにのみ記事を削除する機能
  [![Image from Gyazo](https://i.gyazo.com/edcf62f6bf595337c7ce8ddcbd1b5430.gif)](https://gyazo.com/edcf62f6bf595337c7ce8ddcbd1b5430)

## 記事詳細表示機能
  担当：mun1029   
  内容：投稿した記事のテキスト表示
  [![Image from Gyazo](https://i.gyazo.com/1c8e367dd6f6b0f62d533855d97472b6.gif)](https://gyazo.com/1c8e367dd6f6b0f62d533855d97472b6)

## トップページ（記事一覧）
  担当：wakachico , help:mun1029   
  内容：投稿記事一覧表示（ページネーション）、お気に入りランキングトップ１０

## ヘッダー
  担当：wakachico , mun1029   
  内容：Logo作成、キーワード検索、カテゴリー検索、Welcome文章・新規登録ページ、ビュー制作
  [![Image from Gyazo](https://i.gyazo.com/8c710a4a077788cd598a2bc0c0593aed.gif)](https://gyazo.com/8c710a4a077788cd598a2bc0c0593aed)

## マイページ
  担当：wakachico  
  内容：ユーザ投稿記事一覧、お気に入り記事一覧ページ作成、お気に入りユーザページ遷移ボタン追加
  [![Image from Gyazo](https://i.gyazo.com/d476e16ce0cbafcf8586958dc6026bef.gif)](https://gyazo.com/d476e16ce0cbafcf8586958dc6026bef)

## お気に入り機能
  担当：mun1029   
  内容：１ユーザ１投稿に対して１つのお気に入りできる機能、カウント表示
  [![Image from Gyazo](https://i.gyazo.com/6b9b8c57fbde84c085034c9d962e54e9.gif)](https://gyazo.com/6b9b8c57fbde84c085034c9d962e54e9)

## モデル単体テストコード
  担当：wakachico  
  内容：userモデル、postモデル

## 結合テストコード
  担当：mun1029   
  内容：

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
| text                | text          | null: false                     |
| user                | references    | null: false, foreign_key: true  |
| category            | references    | null: false, foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :category
- has_many :favorites
- has_many :favorite_users, through: :favorites, source: :user

## categories テーブル(ancestryによるテーブル)


| Column     | Type       | Options              |
| ---------- | ---------- | -------------------- |
|            |            |                      |

### Association

- has_many :posts
- has_ancestry

## favorites テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| post       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :post
require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '投稿の保存' do
    context '投稿が保存できる場合' do
      it 'Postsテーブルカラムが全て存在すればが保存できる' do
        expect(@post).to be_valid
      end
    end
    context '投稿が保存できない場合' do
      it 'titleが空では投稿が保存できない' do
        @post.title = ""
        @post.valid?
        expect(@post.errors.full_messages).to include("Title can't be blank")
      end
      it 'textが空では投稿が保存できない' do
        @post.text = ""
        @post.valid?
        expect(@post.errors.full_messages).to include("Text can't be blank")
      end
      it 'category_idが存在しないと投稿が保存できない' do
        @post.category_id = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Category must exist")
      end
      it 'ユーザーが紐付いていなければ投稿が保存できない' do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("User must exist")
      end
    end
  end
end

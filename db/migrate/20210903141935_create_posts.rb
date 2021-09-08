class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string     :title,     null: false
      t.bigint     :category_id,  foreign_key: true
      t.text       :text,      null: false
      t.references :user,      null: false, foreign_key: true
      t.timestamps
    end
  end
end

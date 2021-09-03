class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string     :title,     null: false
      t.integer    :l_cate_id, null: false
      t.integer    :m_cate_id, null: false
      t.integer    :s_cate_id, null: false
      t.text       :text,      null: false
      t.references :user,      null: false, foreign_key: true
      t.timestamps
    end
  end
end

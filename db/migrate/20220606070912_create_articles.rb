class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :text
      t.integer :user_id
      t.integer :body_part_genre_id
      t.integer :gear_genre_id
      t.boolean :article_genre, null: false, default: false #falseで通常の投稿,trueでトレーニングの投稿
      t.timestamps
    end
  end
end

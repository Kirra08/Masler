class CreateBodyPartGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :body_part_genres do |t|
      t.string :name

      t.timestamps
    end
  end
end

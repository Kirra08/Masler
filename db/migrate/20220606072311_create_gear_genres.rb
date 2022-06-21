class CreateGearGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :gear_genres do |t|
      t.string :name

      t.timestamps
    end
  end
end

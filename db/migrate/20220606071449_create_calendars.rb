class CreateCalendars < ActiveRecord::Migration[6.1]
  def change
    create_table :calendars do |t|
      t.integer :user_id
      t.integer :article_id
	    t.integer :set
	    t.integer :weight
	    t.integer :rep
	    t.datetime :start_time
      t.timestamps
    end
  end
end

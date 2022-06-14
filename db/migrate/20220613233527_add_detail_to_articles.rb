class AddDetailToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :method1_text, :text
    add_column :articles, :method2_text, :text
    add_column :articles, :method3_text, :text
    add_column :articles, :method4_text, :text
  end
end

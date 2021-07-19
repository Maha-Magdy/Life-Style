class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.integer :author_id
      t.text :title
      t.text :text

      t.timestamps
    end
  end
end

class CreateArticlesCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :articles_categories do |t|
      t.integer :article_id
      t.integer :category_id
      t.timestamps
    end

    add_foreign_key :articles_categories, :articles, column: :article_id
    add_foreign_key :articles_categories, :categories, column: :category_id
  end
end

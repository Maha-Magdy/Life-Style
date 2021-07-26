class CreateTableArticleCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :articles_categories, id: false do |t|
      t.belongs_to :article
      t.belongs_to :category

      t.timestamps
    end
  end
end

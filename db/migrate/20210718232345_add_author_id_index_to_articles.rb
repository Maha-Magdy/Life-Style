class AddAuthorIdIndexToArticles < ActiveRecord::Migration[6.1]
  def change
    add_index :articles, :author_id
  end
end

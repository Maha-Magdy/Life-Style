class AddIndexCategoriesOnPriority < ActiveRecord::Migration[6.1]
  def change
    add_index :categories, :priority, unique: true
  end
end

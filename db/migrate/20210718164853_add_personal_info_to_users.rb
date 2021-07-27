class AddPersonalInfoToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string, null: false, default: ""
    add_column :users, :gravatar_url, :string
    add_index :users, :name, unique: true
  end
end

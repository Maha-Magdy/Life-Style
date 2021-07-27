class AddFailedAttemptsFieldToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :failed_attempts, :integer
  end
end

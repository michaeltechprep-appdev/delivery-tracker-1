class AddUserIdToPackages < ActiveRecord::Migration[6.0]
  def change
    add_column :packages, :user_id, :integer
  end
end

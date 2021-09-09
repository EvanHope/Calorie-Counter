class AddUseridToFood < ActiveRecord::Migration[6.1]
  def change
    add_column :foods, :userid, :integer
  end
end

class AddPrivilegedUserToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :privileged_user, :boolean, default: false
  end
end

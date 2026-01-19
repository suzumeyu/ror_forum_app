class DeleteForeignKeyFromComments < ActiveRecord::Migration[8.1]
  def change
    remove_foreign_key :comments, column: :parent_id
  end
end

class AddUserToGroups < ActiveRecord::Migration[6.0]
  def change
    add_reference :groups, :user, null: true, foreign_key: true
  end
end

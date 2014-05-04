class AddRoleToIuser < ActiveRecord::Migration
  def change
    add_column :iusers, :role, :string
  end
end

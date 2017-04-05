class RemoveRoleFromEmployes < ActiveRecord::Migration
  def change
  	remove_column :employes, :role
  end
end

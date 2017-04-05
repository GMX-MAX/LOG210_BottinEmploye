class AddRoleRefToEmployes < ActiveRecord::Migration
  def change
    add_reference :employes, :role, index: true, foreign_key: true
  end
end

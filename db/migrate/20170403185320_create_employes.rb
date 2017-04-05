class CreateEmployes < ActiveRecord::Migration
  def change
    create_table :employes do |t|
      t.string :nom
      t.string :prenom
      t.string :adresse
      t.integer :cell
      t.integer :maison
      t.integer :bureau
      t.string :courriel
      t.text :formation
      t.string :role
      t.integer :organisme_id

      t.timestamps null: false
    end
  end
end

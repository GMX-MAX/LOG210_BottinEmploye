class CreateOrganismes < ActiveRecord::Migration
  def change
    create_table :organismes do |t|
      t.string :nom
      t.integer :api_id

      t.timestamps null: false
    end
  end
end

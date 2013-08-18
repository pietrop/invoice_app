class CreateMyDetails < ActiveRecord::Migration
  def change
    create_table :my_details do |t|
      t.string :name
      t.text :address
      t.string :phone
      t.string :email
      t.references :invoice, index: true

      t.timestamps
    end
  end
end

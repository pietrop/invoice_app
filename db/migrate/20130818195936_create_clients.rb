class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :client_name
      t.string :client_address
      t.string :contact_name
      t.string :telephone
      t.string :email
      t.references :invoice, index: true

      t.timestamps
    end
  end
end

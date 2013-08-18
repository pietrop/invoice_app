class CreateFormDetails < ActiveRecord::Migration
  def change
    create_table :form_details do |t|
      t.integer :number
      t.date :date
      t.references :invoice, index: true

      t.timestamps
    end
  end
end

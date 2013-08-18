class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.text :note

      t.timestamps
    end
  end
end

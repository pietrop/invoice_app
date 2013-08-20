class AddMyDetailRefToInvoices < ActiveRecord::Migration
  def change
    add_reference :invoices, :my_detail, index: true
  end
end

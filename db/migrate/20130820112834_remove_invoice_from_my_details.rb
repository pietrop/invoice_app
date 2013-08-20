class RemoveInvoiceFromMyDetails < ActiveRecord::Migration
  def change
    remove_reference :my_details, :invoice, index: true
  end
end

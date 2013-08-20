class RemoveInvoiceFromClients < ActiveRecord::Migration
  def change
    remove_reference :clients, :invoice, index: true
  end
end

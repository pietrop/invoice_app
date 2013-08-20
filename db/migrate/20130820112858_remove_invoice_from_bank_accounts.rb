class RemoveInvoiceFromBankAccounts < ActiveRecord::Migration
  def change
    remove_reference :bank_details, :invoice, index: true
  end
end

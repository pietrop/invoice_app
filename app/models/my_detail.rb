class MyDetail < ActiveRecord::Base
 has_one :bank_account
 has_many :invoices
end

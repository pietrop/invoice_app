class BankDetails < ActiveRecord::Base
  belongs_to :invoice
end

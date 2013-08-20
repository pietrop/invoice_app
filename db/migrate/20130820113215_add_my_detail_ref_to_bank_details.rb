class AddMyDetailRefToBankDetails < ActiveRecord::Migration
  def change
    add_reference :bank_details, :my_detail, index: true
  end
end

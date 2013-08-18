class Invoice < ActiveRecord::Base
	
	has_many :form_details, dependent: :destroy

	has_many :my_details, dependent: :destroy
end

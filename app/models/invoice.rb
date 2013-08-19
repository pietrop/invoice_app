class Invoice < ActiveRecord::Base
	
	has_many :form_details, dependent: :destroy
	has_many :my_details, dependent: :destroy
	has_many :clients, dependent: :destroy
	has_many :services, dependent: :destroy
	has_many :bank_details, dependent: :destroy

	

end

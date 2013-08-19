class Invoice < ActiveRecord::Base
	
	has_one :form_detail, dependent: :destroy
	has_many :my_details, dependent: :destroy
	has_many :clients, dependent: :destroy
	has_many :services, dependent: :destroy
	has_many :bank_details, dependent: :destroy

	def name
		if form_detail && clients.any?
			"#{form_detail.number} #{clients.first.client_name}"
		end
	end 

	

end

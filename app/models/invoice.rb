class Invoice < ActiveRecord::Base
	
	has_one :form_detail
	has_many :services, dependent: :destroy

	belongs_to :client, dependent: :destroy
	belongs_to :my_detail, dependent: :destroy
	  

	def invname
		if form_detail && client.any?
			"00#{form_detail.number}, #{form_detail.date.strftime("%d %b %Y")}, #{clients.first.client_name}, #{services.first.date.strftime("%d %b")} - #{services.last.date.strftime("%d %b")}, #{services.first.service}"
		else 
			'Temporary Invoice Name'
		end
	end 


end

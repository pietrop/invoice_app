class InvoicesController < ApplicationController

	http_basic_authenticate_with name: "p", password: "secret", except: [:index, :show]

#Create
	def new
		 @invoice = Invoice.new
	end

	def create
 	 	# render text: params[:user_detail].inspect

 	 	@invoice = Invoice.new(invoice_params)
 
  		if @invoice.save
		    redirect_to @invoice
		  else
		    render 'new'
		  end
	end

	def invname 

	end 

#Read

	def index
	  @invoices = Invoice.all
	end

	def show
	 	@invoice = Invoice.find(params[:id])
	 	@client = @invoice.client
	 	@my_detail = @invoice.my_detail

	 	if @my_detail
		 	@bank_detail = @my_detail.bank_detail
		 end
	end

#Update
	def edit
	  @invoice = Invoice.find(params[:id])
	end


	def update
	  @invoice = Invoice.find(params[:id])
	 
	  if @invoice.update(invoice_params) 
		   redirect_to @invoice
	  else
	    render 'edit'
	  end
	end


#Delete
	def destroy
	  @invoice = Invoice.find(params[:id])
	  @invoice.destroy
	 
	  redirect_to invoices_path
	end

#strong params
	private
	  def invoice_params
	    params.require(:invoice).permit(:note)
	  end

 
end

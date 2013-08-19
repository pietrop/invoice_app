class ClientsController < ApplicationController
http_basic_authenticate_with name: "p", password: "secret", only: :destroy
	def create
	    @invoice = Invoice.find(params[:invoice_id])
	    @client = @invoice.clients.create(params[:client].permit(:client_name, :client_address, :contact_name, :telephone, :email))
	    redirect_to invoice_path(@invoice)
  end

#client_name:string client_address:string contact_name:string telephone:string email:string invoice:references
  def destroy
    @invoice = Invoice.find(params[:invoice_id])
    @client = @invoice.clients.find(params[:id])
    @client.destroy
    redirect_to invoice_path(@invoice)
  end
 
#Update
  def edit
  @client = client.find(params[:id])
  @invoice = Invoice.find(params[: id])
end

  def update
    @invoice = Invoice.find(params[:post_id])
    @client = FormDetail.find(params[:id])

    if
      @client.update_attributes(params[:client])
      redirect_to @invoice
    else
      render 'edit'
    end
    
  end

  def show
  @invoice = Invoice.find(params[:id])
  @client = @invoice.clients.build
end

#strong params
  private
    def  client_params
      params.require(:client).permit(:client_name, :client_address, :contact_name, :telephone, :email)
    end


end

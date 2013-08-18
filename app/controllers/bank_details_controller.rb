class BankDetailsController < ApplicationController
	http_basic_authenticate_with name: "p", password: "secret", only: :destroy
def create
	    @invoice = Invoice.find(params[:invoice_id])
	    @bank_details = @invoice.bank_details.create(params[:bank_detail].permit(:sort_code, :account_number, :account_name))
	    redirect_to invoice_path(@invoice)
  end


  def destroy
    @invoice = Invoice.find(params[:invoice_id])
    @bank_details = @invoice.bank_details.find(params[:id])
    @bank_details.destroy
    redirect_to invoice_path(@invoice)
  end
 
#Update
  def edit
  @bank_details = bank_details.find(params[:id])
  @invoice = Invoice.find(params[:invoice_id])
end

  def update
    @invoice = Invoice.find(params[:invoice_id])
    @bank_details = BankDetail.find(params[:id])

    if
      @bank_details.update_attributes(params[:bank_detail])
      redirect_to @invoice
    else
      render 'edit'
    end
    
  end

  def show
    @invoice = Invoice.find(params[:id])
    @bank_detail = @invoice.bank_details.build
end

#strong params
  private
    def bank_detail_params
      params.require(:bank_detail).permit(:sort_code, :account_number, :account_name)
    end
end

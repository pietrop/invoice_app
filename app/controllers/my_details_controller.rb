class MyDetailsController < ApplicationController
	http_basic_authenticate_with name: "p", password: "secret", only: :destroy
	def create
	    @invoice = Invoice.find(params[:invoice_id])
	    @my_detail = @invoice.my_details.create(params[:my_detail].permit(:name, :address, :phone, :email))
	    redirect_to invoice_path(@invoice)
  end

  def destroy
    @invoice = Invoice.find(params[:invoice_id])
    @my_detail = @invoice.my_details.find(params[:id])
    @my_detail.destroy
    redirect_to invoice_path(@invoice)
  end
 


#Update
  def edit
  @my_detail = my_detail.find(params[:id])
  @invoice = Invoice.find(params[:invoice_id])
end

  def update
    @invoice = Invoice.find(params[:invoice_id])
    @my_detail = FormDetail.find(params[:id])

    if
      @my_detail.update_attributes(params[:my_detail])
      redirect_to @invoice
    else
      render 'edit'
    end
    
  end

  def show
  @invoice = Invoice.find(params[:id])
  @my_detail = @invoice.my_details.build
end

#strong params
  private
    def my_detail_params
      params.require(:my_detail).permit(:name, :address, :phone, :email)
    end



end

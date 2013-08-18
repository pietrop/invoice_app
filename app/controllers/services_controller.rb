class ServicesController < ApplicationController
http_basic_authenticate_with name: "p", password: "secret", only: :destroy
def create
	    @invoice = Invoice.find(params[:invoice_id])
	    @service = @invoice.services.create(params[:service].permit(:date, :service, :rate))
	    redirect_to invoice_path(@invoice)
  end


  def destroy
    @invoice = Invoice.find(params[:invoice_id])
    @service = @invoice.services.find(params[:id])
    @service.destroy
    redirect_to invoice_path(@invoice)
  end
 
#Update
  def edit
  @service = service.find(params[:id])
  @invoice = Invoice.find(params[:post_id])
end

  def update
    @invoice = Invoice.find(params[:post_id])
    @service = Service.find(params[:id])

    if
      @service.update_attributes(params[:service])
      redirect_to @invoice
    else
      render 'edit'
    end
    
  end

  def show
  @invoice = Invoice.find(params[:id])
  @service = @invoice.services.build
end

#strong params
  private
    def service_params
      params.require(:service).permit(:date, :service, :rate)
    end

end

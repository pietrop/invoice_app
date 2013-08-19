class FormDetailsController < ApplicationController
	http_basic_authenticate_with name: "p", password: "secret", only: :destroy
	def create
	    @invoice = Invoice.find(params[:invoice_id])
	    @form_detail = @invoice.build_form_detail(params[:form_detail].permit(:number, :date))
      @form_detail.save
	    redirect_to invoice_path(@invoice)
  end

  def destroy
    @invoice = Invoice.find(params[:invoice_id])
    @form_detail = @invoice.form_details.find(params[:id])
    @form_detail.destroy
    redirect_to invoice_path(@invoice)
  end
 


#Update
  def edit
  @form_detail = form_detail.find(params[:id])
  @invoice = Invoice.find(params[:post_id])
end

  def update
    @invoice = Invoice.find(params[:post_id])
    @form_detail = FormDetail.find(params[:id])

    if
      @form_detail.update_attributes(params[:form_detail])
      redirect_to @invoice
    else
      render 'edit'
    end
    
  end

  def show
  @invoice = Invoice.find(params[:id])
  @form_detail = @invoice.form_details.build
end

#strong params
  private
    def form_detail_params
      params.require(:form_detail).permit(:number, :date)
    end


end

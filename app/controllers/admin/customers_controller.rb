class Admin::CustomersController < ApplicationController
  layout 'admin'

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    @customer.save
    redirect_to admin_customers_path
  end

  def index
    @customers = Customer.all
  end

  def search
   @customers = Customer.search(params[:keyword])
   @keyword = params[:keyword]
   render "index"
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def destroy
      @customer = Customer.find(params[:id])
      @customer.destroy
      redirect_to admin_customers_path
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customer_path(@customer.id)
  end


  private
  def customer_params
    params.require(:customer).permit(:name, :email, :password)
  end

end

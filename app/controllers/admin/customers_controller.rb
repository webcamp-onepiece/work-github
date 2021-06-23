class Admin::CustomersController < ApplicationController
    
    def index
        @customers = Customer.all
    end    
    
    def show
        @customer = Customer.find(params[:id])
    end    
    
    
    def edit
        @customer = Customer.find(params[:id])
    end    
    
    
    def update
          @customer = Customer.find(params[:id])
      if  @customer.update
          redirect_to admin_customers_path, notice: "You have updated user successfully."
      else
         render edit 
      end  
    end 
    
     private
  # ストロングパラメータ
  def customer_params
    params.require(:customer).permit(:family_name, :first_name,:family_name_kana, :first_name_kana, :address, :phone_number, :postal_code, :email)
  end


    
end

class Public::CustomersController < ApplicationController
    before_action :authenticate_customer!
    
    def show
         @customer = current_customer
        
    end
    
    def edit
        @customer = current_customer
    end
    
    def update
        @customer = current_customer
      if   @customer.update(customer_params)
          redirect_to customers_my_page_path, notice: "You have updated user successfully."
      else
         render edit 
      end 
    end
    
    
    def alert
    end
    
    def withdraw
        @customer = current_customer
        @customer.update(is_deleted: true)
        reset_session
        redirect_to root_path
        
    end
    
     private
  # ストロングパラメータ
  def customer_params
    params.require(:customer).permit(:family_name, :first_name,:family_name_kana, :first_name_kana, :address, :phone_number, :postal_code, :email)
  end
    
    
end

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
      if  @customer.update
          redirect_to customers_my_page_path, notice: "You have updated user successfully."
      else
         render edit 
      end     
    end
    
    
    def alert
    end
    
    def withdraw
        @customer = current_user
        @customer.update(is_deleted: false)
        reset_session
        redirect_to root_path
        
    end
    
    
end

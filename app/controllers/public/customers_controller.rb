class Public::CustomersController < ApplicationController
    before_action :authenticate_user!
    
    def show
         @customer = current_user
        
    end
    
    def edit
        @customer = current_user
    end
    
    def update
        @customer = current_user
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

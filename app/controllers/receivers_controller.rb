class ReceiversController < ApplicationController
     def index
        @receivers = Receiver.all
        @receiver = Receiver.new
     end   
    
    def create
    @receiver = Receiver.new(receiver_params)
    @receiver.customer_id = current_customer.id
    if @receiver.save
      redirect_to receivers_path, notice: "You have created receiver successfully."
    else
      @receivers = Receiver.all
      render 'index'
    end
    end   
    
    def edit
        @receiver = Receiver.find(params[:id])
    end   
    
    def update
        @receiver = Receiver.find(params[:id])
      if  @receiver.update(receiver_params)
          redirect_to receivers_path, notice: "You have updated successfully."
      else
         render edit 
      end 
    end   
    
    def destroy
    @receiver = Receiver.find(params[:id])
    @receiver.destroy
    redirect_to receivers_path
        
    end   
    
    
  private
  # ストロングパラメータ
  def receiver_params
    params.require(:receiver).permit(:name, :postal_code, :address)
  end
    
end

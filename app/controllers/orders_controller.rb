class OrdersController < InheritedResources::Base
  
  def new
    @order = Order.new
    @product = Product.new
    @categories = Category.all
  end
  
  def create
    @order = Order.new(order_params)
    @categories = Category.all
    if @order.save
      redirect_to product_controller
    else
      render :new
    end
    
  end
  
   private
    def order_params
     params.require(:order).permit(:first_name, :last_name , :card_number , :card_type, :card_expires )
    end

end

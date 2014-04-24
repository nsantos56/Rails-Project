class OrdersController < InheritedResources::Base
  
  def index
    @products = Product.all
    @categories = Category.all
  end
  
  def new
    @order = Order.new
    @product = Product.new
    @categories = Category.all
  end
  
  def create
    @order = Order.new(order_params)
    @categories = Category.all
    if @order.save
      redirect_to aciton: :root_path
    else
      render :new
    end
    
  end
  
     private
    def order_params
     params.require(:order).permit(:first_name, :last_name , :card_number , :card_type, :card_expires )
    end
end

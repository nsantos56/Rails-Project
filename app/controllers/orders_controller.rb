class OrdersController < InheritedResources::Base
  
  def new
    @order = Order.new
    @product = Product.new
    @categories = Category.all
  end
  
  def create
    @order = Order.new(params[:order])
    if @order.save
      flash @order.save
      flash[:notice] = "Successfull created order"
      redirect_to orders_url
    else
      render :action => 'new'
      #code
    end
    
  end

end

class ProductsController < ApplicationController
  def index
    @products = Product.all.page(params[:page]).per(4)
    @categories = Category.all
  end
  
  def show
    @product = Product.find(params[:id])
    @categories = Category.all
  end

  def new
    @product = Product.new
    @categories = Category.all
  end

  def create
    @product = Product.new(product_params)
    @categories = Category.all
    if @product.save
      redirect_to aciton: :index
    else
      render :new
    end
  end

  def edit
     @product = Product.find(params[:id])
     @categories = Category.all
  end

  def update
      @product = Product.find(params[:id])
      @categories = Category.all
      if @product.update_attributes(product_params)
        redirect_to @product
      else
        render :edit
      end
      
  end
  
  def search
    
  end
  
  def search_results
     keywords = "%" + params[:search_keywords] + "%"
     category = params[:cat_id][:koko]
    @found_product = Product.where('title LIKE ?  AND category_id = ?' , keywords, "#{category}" ) 
    @categories = Category.all
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to root_path
  end
  

  
  private
    def product_params
     params.require(:product).permit(:title, :description , :price , :stock_quantity, :category_id , :photo)
    end
end

class CartController < ApplicationController
  def index
    
    @cart = session[:kart]
    
    @products = Product.all
    @categories = Category.all
  end

  def add
    (session[:kart] ||= []) << params[:id]
    
    @products = Product.all
    @categories = Category.all
   
    redirect_to :action => :index
  end
  
  def delete_session
    session[:kart] = nil
    redirect_to :action => :add
  end
end

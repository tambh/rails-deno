class WelcomeController < ApplicationController
  def index  
    #@product = Product.all
    #@product = Product.get_products({:code=>'CK01',:name=>'m'})
    @product = Product.get_products()
    #render :json => @product 
    #logger.debug("My object: #{@product.inspect}")
    #myca = "bdsfjdshfjsdhfjsdhfsdfsd"
    #@param_debug = myca
  end 
end

class WelcomeController < ApplicationController
  def index  
    #@product = Product.all
    #@product = Product.get_products({:code=>'CK01',:name=>'m'})
    @product = Product.get_products()
    #render :json => @product 
    #logger.debug("My object: #{@product.inspect}")
    #myca = "bdsfjdshfjsdhfjsdhfsdfsd"
    #@param_debug = myca
    
    #pro=Product.Add_record({:code=>"CK05",:name=>''})    
    #pro=Product.update_record({:code=>"CK04",:name=>''})    
    #@param_debug = pro.errors if !pro.nil?
  end   
end

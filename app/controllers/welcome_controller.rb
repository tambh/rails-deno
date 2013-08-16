class WelcomeController < ApplicationController
  layout "common", except: [:index] #Action khong phai index 
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

    #pro=Product.delete_record({:code=>"CK04",:name=>''})

    #@pro=Product.Add_record({:code=>"CK07",:name=>'Txxvxv',:type=>'zxczxc'})
    #@param_debug = @pro.errors if !@pro.nil?

    #render :index
    @item = Product.find(1)
    # redirect_to(@item) -> url = product_url
    #render "welcome/index"
    #render json:@item
    #render layout: false

    #render text: root_path

    #redirect_to show_welcome_path
    #redirect_to :back

    #redirect_to action: :index , controller: :users
    #render text: welcome_path + ' and ' + welcome_url
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @product }
    end
  end

  def show
    #render text: welcome_path + ' and ' + welcome_url
    render :show
  end
end


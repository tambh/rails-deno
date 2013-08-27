class WelcomeController < ApplicationController
  #layout "common", except: [:index] #Action khong phai index
  def index
    @param_debug = Product.typepp
    @product = Product.all
    #@product = Product.get_products({:code=>'CK01',:name=>'m'})
    # @product = Product.get_products()
    @item = Product.new
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
    #@item = Product.find(1)
    # redirect_to(@item) -> url = product_url
    #render "welcome/index"
    #render json:@item
    #render layout: false

    #render text: root_path

    #redirect_to show_welcome_path
    #redirect_to :back

    #redirect_to action: :index , controller: :users
    #render text: welcome_path + ' and ' + welcome_url

    if session[:demo_session].nil?
      session[:demo_session] = "Welcome to Ruby session 2"
    end

    if cookies[:demo_cookie].nil?
      cookies[:demo_cookie]="Welcome to Ruby cookies 2"
    end

    @ss_demo = session[:demo_session]
    @ck_demo = cookies[:demo_cookie]

    flash[:msg1]="Test flash 1"
    flash[:msg2]="Test flash 2"

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @product }
    end
  end

  def show
    #render text: welcome_path + ' and ' + welcome_url
    @assets_file = "#{Rails.root}/app/assets/files"

    #if File.exists?(path) && File.directory?(path)
    # if File.directory?(@assets_file)
    # File.open(File.join(@assets_file, 'test.txt'), 'w+') do |f|
    # f.puts "contents"
    # end
    # end

    render :show
  end

  def uploadFile
    post = Datafile.save(params[:upload])
    render :text => "File has been uploaded successfully"
  end
  
  def upload
     render :uploadfile
  end

  def products
    data = {}

    if params[:id].nil? || params[:id]=='0'
      data[:msg]="Error post ajax"
    else
      data[:msg]=""
      data[:id]=params[:id]
      pro = Product.find_by_id(params[:id])
      if (pro)
        data[:product] =  pro
      else
        data[:msg]="Error post ajax"
      end
    end
    render json: data
  end
end


class Product < ActiveRecord::Base
  self.table_name = "product"    
  attr_accessible :code,:name
  validates :code,:name, presence:true
  validates :code, uniqueness: true
  
  def Product.get_products(prams={})   
    sql = "SELECT id, code, name FROM product "
    
    sql_where = ""
    if !prams[:code].nil?
        sql_where += " AND code = '" + prams[:code] + "'"       
     end
     
     if !prams[:name].nil?
        sql_where += " AND name LIKE '%" + prams[:name] + "%'"       
     end
     
     if (sql_where.empty?)
       Product.find_by_sql(sql); 
     else
       Product.find_by_sql(sql + " WHERE 1=1 " + sql_where);
     end   
  end
  
  def Product.Add_record(params)
    #Product.create(code:params[:code],name:params[:name])
    #Product.create(params)
    model = Product.new
    model.code = params[:code]
    model.name = params[:name]
    model.save
    return model
  end
end
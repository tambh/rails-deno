class Product < ActiveRecord::Base
  self.table_name = "product"    
  attr_accessible :code,:name, :type
  validates :code,:name, presence:true
  validates :code, uniqueness: true  
  validates :type, numericality: { only_integer: true }
  validates :type, exclusion: { in: [3,6,9], message: "type %{value} is reserved." }
  #validates :type, inclusion: { in: [3,6,9], message: "type %{value} is not a valid."  }
  validates :name, format: {with: /\A[a-zA-Z]+\z/, message: "Only letters allowed"}, length:{minimum: 2}
  
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
    model.type = params[:type]
    model.save
    return model
  end
  
  def Product.update_record(params)    
    model = Product.find_by_code(params[:code])
    if (model)
      model.name = params[:name]
      model.type = params[:type]
      model.save  
    end  
    
    return model
  end
  
  def Product.delete_record(params)
    model = Product.find_by_code(params[:code])
    if (model)
       model.destroy
    end
    
    return model
  end
end
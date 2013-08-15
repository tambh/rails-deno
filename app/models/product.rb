class Product < ActiveRecord::Base
  self.table_name = "product"
  
    
  
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
end
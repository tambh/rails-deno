class Datafile < ActiveRecord::Base
#class Datafile < CarrierWave::Uploader::Base
  #validates_attachment_size :upload, :less_than => 2.megabytes,
  #                :with => %r{\.(rar|tar|zip)$}i
  #validates_format_of :upload['datafile'].original_filename, :with => %r{\.(png|jpg|jpeg)$}i, :message => "whatever"
  FILE_EXTENSIONS = [".png",".jpg",".jpeg"] #Allowed file types
  FILE_MAXIMUM_SIZE_FOR_FILE=2*1048576 #Maximum Size (1MB) define in bytes
  
  def self.save(upload)
    name =  upload['datafile'].original_filename
    extension = File.extname(name)
    size = upload['datafile'].size
    
    if extension.nil?
      #none
    else
      if FILE_EXTENSIONS.include?(extension) == false
        return
      end
    end
    
    if size > FILE_MAXIMUM_SIZE_FOR_FILE
      return
    end
    
    directory = "#{Rails.root}/app/assets/files"
    # create the file path
    path = File.join(directory, name)
    # write the file
    File.open(path, "wb") { |f| f.write(upload['datafile'].read) }
  end 
end
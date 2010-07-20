class Person < ActiveRecord::Base
  has_one :image, :class_name => 'UploadJuicer::Upload', :as => :uploadable
  
  after_save :process_image

  attr_accessor :image_key, :image_id
  
  def process_image
    return if @image_key.blank? || @image_id.blank?
    if self.image = UploadJuicer::Upload.first(:conditions => { :key => @image_key, :id => @image_id, :uploadable_id => nil })
      image.juice_upload(:avatar => { :size => '40x40>' }) rescue nil
    end
  end
end

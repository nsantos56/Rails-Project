require 'paperclip/media_type_spoof_detector'
module Paperclip
  class MediaTypeSpoofDetector
    def spoofed?
      false
    end
  end
end

class Product < ActiveRecord::Base
  belongs_to :category
  
  validates :title , :price , :stock_quantity , presence: true
  validates :price , numericality: {greater_thatn_or_equal_to: 0.01}
  validates :stock_quantity,  numericality: {only_integer: true}

  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  #validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  do_not_validate_attachment_file_type :photo
end

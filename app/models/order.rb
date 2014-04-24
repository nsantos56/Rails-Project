class Order < ActiveRecord::Base
  belongs_to :cart
  
  attr_accessor :card_number , :card_verification


  validates :first_name , :last_name , :card_number ,:card_type,:card_expires, presence: true
end

class Cart < ActiveRecord::Base
  has_many :line_items
  has_one :order
end

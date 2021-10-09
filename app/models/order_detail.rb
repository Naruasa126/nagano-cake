class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  enum making_status: {not_produce: 0,wait_production: 1,production: 2,complete: 3}
end

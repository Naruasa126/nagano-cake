class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  belongs_to :customer
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: {waiting_pay: 0,pay_complete: 1,production: 2,prepar_wait: 3,sent: 4}

  def total
    item.tax_price * amount
  end

  def subtotal
    order_details.item.tax_price * order_details.amounts
  end

  def full_address
    '〒' + postal_code + ' ' + address + ' ' + name
  end

end

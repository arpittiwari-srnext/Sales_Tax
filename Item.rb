require './ApplicationModel.rb'
class Item < ApplicationModel

  attr_accessor :order_id, :product_name, :product_price, :product_quantity

  def initialize(order_id,product_name,product_price,product_quantity)
    @order_id=order_id
    @product_name=product_name
    @product_price=product_price
    @product_quantity=product_quantity
  end
end
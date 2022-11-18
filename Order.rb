require './ApplicationModel.rb'
require './CalculateTax.rb'
class Order < ApplicationModel

  include CalculateTax 

  has_many :items


  attr_accessor :product_details, :order_id, :total_sales_tax, :total_price
  
  def initialize(order_id,product_details)
    @total_sales_tax=0
    @total_price=0
    @order_id=order_id
    @product_details=product_details
    str = product_details.split("\n")
    str.each do |com|
      
      com = com.split(" ")
      product_quantity = com[0].to_i
      product_name = com.slice(1,com.length-3).join" "
      product_price = com[-1].to_f
      Item.new(order_id,product_name,product_price,product_quantity)
    end
  end


  def bill
    self.items.each do |item|
      tax = tax_rate(item.product_quantity,item.product_name,item.product_price)
      @total_sales_tax +=tax
      @total_price += item.product_price + tax
      print_bill(item.product_quantity,item.product_name,item.product_price, tax)
    end  
  puts"Sales Taxes: #{'%.2f'%(@total_sales_tax)}\nTotal: #{'%.2f'%(@total_price)}" 
  end
end

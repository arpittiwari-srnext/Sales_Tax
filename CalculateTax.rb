module CalculateTax
  def item_exempted?(product_name)
    product_name.split.any? {|name| ["book", "chocolate","chocolates", "pill", "pills"].include? name}
  end

  def item_imported?(product_name)
    product_name.include? "imported"
  end

  def tax_rate(product_quantity,product_name,product_price)

    tax = 0
    tax += (product_price * 5/100).ceil(1).to_f if item_imported?(product_name)
    tax += (product_price * 10/100).to_f unless item_exempted?(product_name)
    tax


    # if item_imported?(product_name)
    #   if item_exempted?(product_name)
    #     imported_tax = (product_price * 5/100).ceil(1).to_f
    #     @total_sales_tax += imported_tax
    #     @total_price += (product_price + imported_tax)
    #     puts "#{product_quantity} #{product_name} : #{'%.2f'%(product_price + imported_tax)}" 

    #   else
    #     basic_sales_tax =( product_price * 10/100).to_f
    #     imported_tax = (product_price * 5/100).ceil(1).to_f
    #     @total_sales_tax += (imported_tax + basic_sales_tax)
    #     @total_price += (product_price + imported_tax + basic_sales_tax)
    #     puts "#{product_quantity} #{product_name} : #{'%.2f'%(product_price + imported_tax+ basic_sales_tax)}" 
    #   end

    # else
    #    if item_exempted?(product_name)
    #     @total_price += product_price
    #     puts "#{product_quantity} #{product_name} : #{'%.2f'%(product_price)}" 
    #   else
    #     basic_sales_tax = (product_price * 10/100).to_f
    #     @total_sales_tax += basic_sales_tax
    #     @total_price += product_price + basic_sales_tax
    #     puts "#{product_quantity} #{product_name} : #{'%.2f'%(product_price + basic_sales_tax)}"
    #   end
    # end
  end

  def print_bill(product_quantity, product_name, product_price, tax)
    puts "#{product_quantity} #{product_name} : #{'%.2f'%(product_price + tax)}" 
  end

end

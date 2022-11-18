require './ApplicationModel.rb'
require './Item.rb'
require './Order.rb'
o1 = Order.new(1,'1 chocolate bar at 0.85
1 book at 12.49
1 music CD at 14.99')
p ObjectSpace.each_object(Item).count
o1.bill

o2 = Order.new(2,'1 imported box of chocolates at 10.00
1 imported bottle of perfume at 47.50')
o2.bill

o3=Order.new(3,"1 imported bottle of perfume at 27.99
1 bottle of perfume at 18.99
1 packet of headache pills at 9.75
1 imported box of chocolates at 11.25")

o3.bill

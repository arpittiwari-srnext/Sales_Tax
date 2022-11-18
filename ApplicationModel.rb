
class ApplicationModel
  def self.has_many(*args)
    define_method args[0].to_sym do
      klass = args[0][0,4]
      klass = Object.const_get(klass.capitalize)
      klass=ObjectSpace.each_object(klass).select{|x| x.order_id == self.order_id}
    end    
  end
end

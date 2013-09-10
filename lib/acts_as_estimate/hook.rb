module ActsAsEstimate::Hook
  def acts_as_estimate(*args)
    field_name = args[0].to_sym
    options = args.extract_options!
    include ActsAsEstimate::InstanceMethods
    
    class_eval <<-EOV
      def #{field_name}()
        read_estimate_field(field_name)
      end
      
      def #{field_name}_text=(new_value)
        write_estimate_field(field_name, new_value)
      end
    EOV
  
    
    p " => instace methods added"
    before_filter :an_awesome_filter
    p " => filter added"
  end
end
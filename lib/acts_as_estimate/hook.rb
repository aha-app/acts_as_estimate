module ActsAsEstimate::Hook
  UNITS_STORY_POINTS = 10
  UNITS_MINUTES = 20
  
  def acts_as_estimate(*args)
    field_name = args[0].to_sym
    options = args.extract_options!
    
    include ActsAsEstimate::InstanceMethods
    
    class_eval <<-EOV
      def estimate_units
        read_attribute(:#{options[:units_field]})
      end
      
      def #{field_name}()
        read_estimate_field(field_name)
      end
      
      def #{field_name}_text=(new_value)
        write_estimate_field(field_name, new_value)
      end
    EOV
  end
end
module ActsAsEstimate::Hook
  def acts_as_estimate(*args)
    field_name = args[0].to_s
    options = args.extract_options!
    include ActsAsEstimate::InstanceMethods
    
    class_eval <<-EOV
      def #{field_name}()
        if self.#{field_name}
      end
      
      def #{field_name}_text=(new_value)
      end
    EOV
  
     def original_estimate_description=(new_value)
        new_value.strip!
        if work_units == TimeTrackingEvent::TRACKING_UNIT_POINTS
          write_attribute(:original_estimate, new_value.gsub(/p/, ""))
        else
          if new_value =~ /^[0-9]+$/
            # If only a number is entered, assume units are days.
            new_value = "#{new_value}d"
          end
          duration = ChronicDuration.parse(new_value)
          if duration
            logger.debug("DURATION: #{duration.inspect}")
            write_attribute(:original_estimate, duration / 60)
          end
        end
      end
      
      def original_estimate_description
        if self.original_estimate
          ChronicDuration.output(self.original_estimate * 60, format: :short)
        end
      end
    
    p " => instace methods added"
    before_filter :an_awesome_filter
    p " => filter added"
  end
end
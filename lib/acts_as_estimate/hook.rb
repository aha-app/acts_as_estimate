module ActsAsEstimate::Hook

  def acts_as_estimate(*args)
    field_name = args[0].to_sym
    options = args.extract_options!
  
    include ActsAsEstimate::InstanceMethods

    units_fields = self.units_fields rescue []
    units_fields = units_fields.push(options[:units_field].intern).uniq

    class_exec(units_fields) do |units_fields|
      define_singleton_method :units_fields do
        units_fields
      end

      # The logic of write_estimate_field depends on the units field being set first
      define_method :assign_attributes do |new_attributes, a_options={}|
        priority_assigns = new_attributes.keys.map(&:intern) & self.class.units_fields
        priority_assigns.each do |key|
          self.send("#{key}=", new_attributes[key] || new_attributes[key.to_s])
        end

        super(new_attributes, a_options)
      end

      define_method :estimate_units do
        send(options[:units_field])
      end

      define_method "#{field_name}_text" do
        read_estimate_field(field_name)
      end

      define_method "#{field_name}_text=" do |new_value|
        write_estimate_field(field_name, new_value)
      end
    end
  end
end

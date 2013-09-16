module ActsAsEstimate::InstanceMethods
  def read_estimate_field(field_name)
    val = send(field_name)
    estimate_value_to_text(val)
  end
  
  def write_estimate_field(field_name, new_value)
    new_value.strip!
    if estimate_units == ActsAsEstimate::ESTIMATE_UNITS_STORY_POINTS
      send("#{field_name}=", new_value.gsub(/p/, "").to_i)
    else
      if new_value =~ /^[0-9]+$/
        # If only a number is entered, assume units are days.
        new_value = "#{new_value}d"
      end
      if new_value.to_i == 0
        duration = 0
      else
        duration = ChronicDuration.parse(new_value)
      end
      send("#{field_name}=", duration / 60) if duration
    end
  end
  
  def estimate_value_to_text(value)
    unless value.nil?
      if estimate_units == ActsAsEstimate::ESTIMATE_UNITS_STORY_POINTS
        "#{value}p"
      elsif value == 0
        "0"
      else
        ChronicDuration.output(value * 60, format: :short)
      end
    end
  end
  
end

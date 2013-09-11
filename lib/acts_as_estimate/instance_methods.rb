module ActsAsEstimate::InstanceMethods
  def read_estimate_field(field_name)
    val = read_attribute(field_name)
    if val
      if estimate_units == ESTIMATE_UNITS_STORY_POINTS
        "#{val}p"
      else
        ChronicDuration.output(val * 60, format: :short)
      end
    end
  end
  
  def write_estimate_field(field_name, new_value)
    new_value.strip!
    if work_units == ESTIMATE_UNITS_STORY_POINTS
      write_attribute(field_name, new_value.gsub(/p/, ""))
    else
      if new_value =~ /^[0-9]+$/
        # If only a number is entered, assume units are days.
        new_value = "#{new_value}d"
      end
      duration = ChronicDuration.parse(new_value)
      write_attribute(field_name, duration / 60) if duration
    end
  end
end

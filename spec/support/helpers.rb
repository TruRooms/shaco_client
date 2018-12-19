module Helpers
  def underscore(s)
    s.to_s.scan(/[A-Z][a-z]*/).join("_").downcase
  end

  def camelize(s)
    s[0] + s.to_s.split("_").each {|s| s.capitalize! }.join("")[1..-1]
  end
end

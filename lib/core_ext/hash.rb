# @private
class Hash
  def camelize_keys!
    self.keys.each_with_index do |key, i|

      value = delete(key)

      camelized_key = key.to_s.split('_').each_with_index do |s, idx|
        next if idx.zero?

        s.capitalize!
      end.join('').to_sym

      self[camelized_key] = value
    end
  end
end

class TextEng::Name
  def self.first_name
    first_name = FIRST_NAMES.sample
    first_name[0] = first_name[0].upcase
    first_name
  end

  def self.last_name
    last_name = LAST_NAMES.sample
    last_name[0] = last_name[0].upcase
    last_name
  end

  def self.name
    "#{self.first_name} #{self.last_name}"
  end
end

class Filler::Name
  def self.first_name
    FIRST_NAMES.sample
  end

  def self.last_name
    LAST_NAMES.sample
  end

  def self.name
    "#{self.first_name} #{self.last_name}"
  end
end
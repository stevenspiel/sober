class TextEng::Name
  def self.first_name(gender = :any)
    if gender == :male
      first_name = (FIRST_NAMES_M).sample
    elsif gender == :female
      first_name = (FIRST_NAMES_F).sample
    elsif gender == :any
      first_name = (FIRST_NAMES_M + FIRST_NAMES_F).sample
    end

    first_name[0] = first_name[0].upcase
    first_name
  end

  def self.last_name
    last_name = LAST_NAMES.sample
    last_name[0] = last_name[0].upcase
    last_name
  end

  def self.name(gender = :any)
    "#{self.first_name(gender)} #{self.last_name}"
  end
end

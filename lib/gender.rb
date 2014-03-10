GENDER_SHORT = ['m','f']
GENDER_LONG = ['male','female']

class TextEng::Gender
  def self.random(size = :full)
    size == :full ? GENDER_LONG.sample : GENDER_SHORT.sample
  end
end
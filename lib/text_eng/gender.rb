GENDER_SHORT = ['m','f']
GENDER_LONG = ['male','female']

class TextEng::Gender
  def self.random(params = {})
    one_letter = params[:one_letter]
    one_letter == true ? GENDER_SHORT.sample : GENDER_LONG.sample
  end
end
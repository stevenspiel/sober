GENDER_SHORT = ['m','f']
GENDER_LONG = ['male','female']

class TextEng::Gender
  def self.random(params = {})
    one_letter = params[:one_letter]
    one_letter == true ? GENDER_SHORT.sample : GENDER_LONG.sample
  end

  def self.smart(name,params = {})
    one_letter = params[:one_letter]
 
    if FIRST_NAMES_M.include?(name)
      one_letter == true ? 'm' : 'male'
    elsif FIRST_NAMES_F.include?(name)
      one_letter == true ? 'f' : 'female'
    else
      raise NameNotRecognizedError
    end
  end
end

class NameNotRecognizedError < StandardError
  def initialize(msg = "That name is not recognized. Try using one in the standard library (e.g. TextEng::Name.name(:male))")
    super(msg)
  end
end
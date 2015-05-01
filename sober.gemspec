$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "sober/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "sober"
  s.version     = TextEng::VERSION
  s.authors     = ["Steven Spiel"]
  s.email       = ["stevenspiel@gmail.com"]
  s.homepage    = "http://www.stevenspiel.com"
  s.summary     = "Generate English filler text"
  s.description = "Random text generation in English form"
  s.license     = 'mit'

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.0"
  s.add_development_dependency "rspec"
end

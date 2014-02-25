$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "filler/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "filler"
  s.version     = Filler::VERSION
  s.authors     = ["Steven Spiel"]
  s.email       = ["stevenspiel@gmail.com"]
  s.homepage    = "http://www.stevenspiel.com"
  s.summary     = "Generate English filler text"
  s.description = "Add filler text in English form"
  s.license     = 'mit'

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.2"

  s.add_development_dependency "sqlite3"
end

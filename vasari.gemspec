$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "vasari/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "vasari"
  s.version     = "0.1.0"
  s.authors     = [""]
  s.email       = ["cbrandolino@gmail.com"]
  s.homepage    = "http://github.com/baphomet-berlin/vasari"
  s.summary     = "A Rails engine for artist portfolios."
  s.description = "No one ever became excellent in any exercise whatsoever 
    without beginning from his childhood to endure heat, 
    cold, hunger, thirst, and other discomforts. […] 
    It is not by sleeping but by waking and studying 
    continually that progress is made."

  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2"
  s.add_dependency 'paperclip', '~> 4.3'

  s.add_development_dependency "sqlite3"
end

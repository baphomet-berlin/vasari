$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "vasari/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "vasari"
  s.version     = "0.1.0"
  s.authors     = [""]
  s.email       = ["cbrandolino@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Vasari."
  s.description = "TODO: Description of Vasari."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.5"

  s.add_development_dependency "sqlite3"
end

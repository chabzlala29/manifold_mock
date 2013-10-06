$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "templator_chabz/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "templator_chabz"
  s.version     = TemplatorChabz::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of TemplatorChabz."
  s.description = "TODO: Description of TemplatorChabz."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.0"

  s.add_development_dependency "sqlite3"
end

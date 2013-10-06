$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "templator_chabz/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "templator_chabz"
  s.version     = TemplatorChabz::VERSION
  s.authors     = ["Chabz"]
  s.email       = ["cpobre.peg@gmail.com"]
  s.homepage    = "http://github.com/chabzlala29/templator_chabz"
  s.summary     = %q{Templated Wonders}
  s.description = %q{An easy tool to generate your templates in just one command. Choose from different kind of templates.}

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.0"

  s.add_development_dependency "sqlite3"
end

$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require 'railsyard-backend/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "railsyard-backend"
  s.version     = Railsyard::Backend::VERSION
  s.authors     = ["Stefano Verna", "Francesco Disperati", "Silvio Relli"]
  s.email       = ["s.verna@cantierecreativo.net", "f.disperati@cantierecreativo.net"]
  s.homepage    = "http://railsyardcms.org"
  s.summary     = "Backend module for Railsyard: a modular, free and open source Ruby on Rails 3.2 CMS"
  s.description = "Backend module for Railsyard: a modular, free and open source Ruby on Rails 3.2 CMS"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails"
  s.add_dependency "sass-rails"
  s.add_dependency "slim-rails"
  s.add_dependency "simple_form"
  s.add_dependency "jquery-rails"
  s.add_dependency "compass-rails"
  s.add_dependency "coffee-rails"
  s.add_dependency "blockenspiel"
  s.add_dependency "responders"
  s.add_dependency "formalize-rails"
  s.add_dependency "humane-rails"
  s.add_dependency "kaminari"

  s.add_development_dependency "spork"
  s.add_development_dependency "capybara"
  s.add_development_dependency "capybara-webkit"
  s.add_development_dependency "rspec-rails-mocha"
  s.add_development_dependency "database_cleaner"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "launchy"
end

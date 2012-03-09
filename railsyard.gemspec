$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "railsyard/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "Railsyard"
  s.version     = Railsyard::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Railsyard."
  s.description = "TODO: Description of Railsyard."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "sass-rails"
  s.add_dependency "rails"
  s.add_dependency "slim"
  s.add_dependency "simple_form"
  s.add_dependency "cancan"
  s.add_dependency "jquery-rails"
  s.add_dependency "compass-rails"
  s.add_dependency "coffee-rails"

  s.add_development_dependency "capybara"
  s.add_development_dependency "capybara-webkit"
  s.add_development_dependency "rspec-rails-mocha"
  s.add_development_dependency "database_cleaner"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "launchy"
end

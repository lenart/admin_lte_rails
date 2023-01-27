# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "admin_lte_rails/version"

Gem::Specification.new do |spec|
  spec.name          = "admin_lte_rails"
  spec.version       = AdminLteRails::VERSION
  spec.authors       = ["Lenart Rudel", "Aleš Rosina"]
  spec.email         = ["lenart.rudel@gmail.com", "ales.rosina@gmail.com"]

  spec.summary       = "Rails gem for AdminLTE admin theme"
  spec.description   = "A convenient way to add AdminLTE theme to your rails project"
  spec.homepage      = "https://github.com/lenart/admin_lte_rails"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_dependency "bootstrap-sass", "~> 3.3"
  spec.add_dependency "ckeditor", "~> 4.1"
  spec.add_dependency "jquery-rails", "~> 4.0"

  spec.add_development_dependency "bundler", ">= 1.8"
  spec.add_development_dependency "rake", ">= 10.0"
end

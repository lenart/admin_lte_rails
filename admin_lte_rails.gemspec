# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'admin_lte_rails/version'

Gem::Specification.new do |spec|
  spec.name          = "admin_lte_rails"
  spec.version       = AdminLteRails::VERSION
  spec.authors       = ["Lenart Rudel", "Aleš Rosina"]
  spec.email         = ["lenart.rudel@gmail.com", "ales.rosina@gmail.com"]

  spec.summary       = %q{Rails gem for AdminLTE admin theme}
  spec.description   = %q{A convenient way to add AdminLTE theme to your rails project}
  spec.homepage      = "https://github.com/lenart/admin_lte_rails"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  # end

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "bootstrap-sass"
  spec.add_dependency "jquery-rails"
  spec.add_dependency "jquery-ui-rails"

end

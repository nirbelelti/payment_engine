require_relative "lib/payment_engine/version"

Gem::Specification.new do |spec|
  spec.name        = "payment_engine"
  spec.version     = PaymentEngine::VERSION
  spec.authors     = ["nirbelelti"]
  spec.email       = ["nirbelelti@gmail.com"]
  spec.homepage    = "https://github.com/nirbelelti/PaymentsApplicationDemo"
  spec.summary     = "This Payment Engine created to isolate ."
  spec.description = " Description of PaymentEngine."

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "https://https://github.com/nirbelelti/PaymentsDemoApp/tree/main"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://https://github.com/nirbelelti/PaymentsDemoApp/tree/main"
  spec.metadata["changelog_uri"] = "https://https://github.com/nirbelelti/PaymentsDemoApp/tree/main"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.1.3.2"
end

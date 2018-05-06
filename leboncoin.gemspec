
lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'leboncoin/version'

# rubocop:disable Metrics/BlockLength
Gem::Specification.new do |spec|
  spec.name          = 'leboncoin'
  spec.version       = Leboncoin::VERSION
  spec.authors       = ['Thomas Tych']
  spec.email         = ['thomas.tych@gmail.com']

  spec.summary       = 'Automate action on leboncoin.'
  spec.description   = 'Sell, search, ... on leboncoin.fr.'
  spec.homepage      = 'https://gitlab.com/ttych/rb_leboncoin'
  spec.license       = 'MIT'

  # Prevent pushing this gem to RubyGems.org.
  # To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host
  # or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise 'RubyGems 2.0 or  newer is required to protect against ' \
          'public gem pushes.'
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'capybara', '~> 2.7', '>= 2.7.1'
  spec.add_dependency 'capybara-webkit', '~> 1.11', '>= 1.11.1'
  spec.add_dependency 'selenium-webdriver', '~> 3.11'

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'faker'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'reek'
  spec.add_development_dependency 'rubocop'
end
# rubocop:enable Metrics/BlockLength

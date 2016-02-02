require File.dirname(__FILE__) +  '/lib/web_image_compare/version'

Gem::Specification.new do |s|
  s.name        = 'web_image_compare'
  s.summary     = 'Web'
  s.description = 'A tool to compare images base in web elements'
  s.author      = 'Rui Nunes'
  s.email       = 'rui@brandwatch.com'
  s.license     = 'MIT'
  s.homepage    = 'https://github.com/Rui-Pedro-Nunes/web-image-compare.git'

  s.date    = CmpImgTool::Version::DATE
  s.version = CmpImgTool::Version::VERSION
  s.version = "#{s.version}.pre.#{ENV['BUILD_NUMBER']}" if ENV['PRE_RELEASE']

  s.required_ruby_version = '>= 2.0.0'

  s.files         = `git ls-files`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.test_files    = `git ls-files -- spec/*`.split("\n")
  s.require_paths = ['lib']

  s.add_development_dependency 'rspec', '~> 3.0', '>= 3.0.0'
  s.add_development_dependency 'rubocop', '~> 0.24', '>= 0.24.1'
  s.add_development_dependency 'rake', '~> 10.4'
  s.add_development_dependency 'yard', '~> 0.8'

  s.add_runtime_dependency 'oily_png', '~> 1.1'
end

Gem::Specification.new do |s|
  s.name        = 'grobber'
  s.version     = '0.0.2'
  s.date        = '2014-12-08'
  s.summary     = "Grobber Generator"
  s.description = "Generate a picture based on a string value"
  s.authors     = ["Theo C"]
  s.email       = 'superkoinkoin@gmail.com'
  s.files       = ["lib/grobber.rb", "lib/grobber/image.rb", "lib/grobber/square_matrix.rb"]
  s.homepage    =
    'http://rubygems.org/gems/grobber'
  s.license       = 'MIT'
  s.add_runtime_dependency "rmagick",
    ['~> 2.0', '>= 2.0.0']
end

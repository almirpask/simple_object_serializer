Gem::Specification.new do |s|
  s.author = "almirpask"
  s.email= 'almirpask@hotmail.com'
  s.name = %q{simple_object_serializer}

  s.homepage = "https://github.com/almirpask/simple_object_serializer"
  s.license = "MIT"
  s.version = "0.0.1"
  s.date = %q{2019-05-26}
  s.summary = %q{this gem transforms a sequence of objects into one by selecting only the desired properties of them}
  s.files = [
    "lib/simple_object_serializer.rb"
  ]
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec", "~> 3.0"
end

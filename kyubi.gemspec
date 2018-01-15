$LOAD_PATH.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "kyubi/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "kyubi"
  s.version     = Kyubi::VERSION
  s.authors     = ["yiyenene"]
  s.email       = ["goodbyeboredworld@aol.jp"]
  s.homepage    = "https://github.com/yiyenene/kyubi"
  s.summary     = "Supports settings of page specified assets load and precompile."
  s.description = "can load stylesheet and javascript file from assets/views folder that have same structures with app/views folder."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.4"

  s.add_development_dependency "sqlite3"
end

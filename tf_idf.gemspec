# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{tf_idf}
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["reddavis"]
  s.date = %q{2010-01-06}
  s.description = %q{A TF-IDF in ruby - http://en.wikipedia.org/wiki/Tf–idf}
  s.email = %q{reddavis@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "lib/tf_idf.rb",
     "spec/spec.opts",
     "spec/spec_helper.rb",
     "spec/tf_idf_spec.rb",
     "tf_idf.gemspec"
  ]
  s.homepage = %q{http://github.com/reddavis/TF-IDF}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{A TF-IDF in ruby - http://en.wikipedia.org/wiki/Tf–idf}
  s.test_files = [
    "spec/spec_helper.rb",
     "spec/tf_idf_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 1.2.9"])
    else
      s.add_dependency(%q<rspec>, [">= 1.2.9"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 1.2.9"])
  end
end


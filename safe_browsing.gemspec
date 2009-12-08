# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{safe_browsing}
  s.version = "0.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Cedric Howe"]
  s.date = %q{2009-12-08}
  s.description = %q{Google SafeBrowsingAPI phishing and malware blacklist.}
  s.email = %q{cedric@patch.com}
  s.extra_rdoc_files = ["README.rdoc", "lib/safe_browsing.rb"]
  s.files = ["README.rdoc", "Rakefile", "init.rb", "lib/safe_browsing.rb", "Manifest", "safe_browsing.gemspec"]
  s.homepage = %q{http://github.com/cedric/safe_browsing}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Safe_browsing", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{safe_browsing}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Google SafeBrowsingAPI phishing and malware blacklist.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

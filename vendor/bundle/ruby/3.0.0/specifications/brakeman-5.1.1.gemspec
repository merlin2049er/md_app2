# -*- encoding: utf-8 -*-
# stub: brakeman 5.1.1 ruby lib

Gem::Specification.new do |s|
  s.name = "brakeman".freeze
  s.version = "5.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/presidentbeef/brakeman/issues", "changelog_uri" => "https://github.com/presidentbeef/brakeman/releases", "documentation_uri" => "https://brakemanscanner.org/docs/", "homepage_uri" => "https://brakemanscanner.org/", "mailing_list_uri" => "https://gitter.im/presidentbeef/brakeman", "source_code_uri" => "https://github.com/presidentbeef/brakeman", "wiki_uri" => "https://github.com/presidentbeef/brakeman/wiki" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Justin Collins".freeze]
  s.date = "2021-07-20"
  s.description = "Brakeman detects security vulnerabilities in Ruby on Rails applications via static analysis.".freeze
  s.email = "gem@brakeman.org".freeze
  s.executables = ["brakeman".freeze]
  s.files = ["bin/brakeman".freeze]
  s.homepage = "https://brakemanscanner.org".freeze
  s.licenses = ["Brakeman Public Use License".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.4.0".freeze)
  s.rubygems_version = "3.2.3".freeze
  s.summary = "Security vulnerability scanner for Ruby on Rails.".freeze

  s.installed_by_version = "3.2.3" if s.respond_to? :installed_by_version
end

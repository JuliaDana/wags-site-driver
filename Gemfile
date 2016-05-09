# This is the tested version of ruby with this project. Comment out this 
# line to try it with a different version.
#ruby=jruby-9.1.0.0
ruby '2.3.0', :engine => 'jruby', :engine_version => '9.1.0.0'

source 'https://rubygems.org'

gem "magnetizer", :git => "https://github.com/juliadana/wags-magnetizer.git"

gem "rspec"

gem "mime-types", "2.6.2" # Is a dependency of capybara, but the version that tries to autoinstall now requires ruby 2.0
gem "capybara", "2.5.0" # Latest version does not have Capybara::DSL defined

gem "poltergeist"
gem "selenium-webdriver"

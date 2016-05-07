require "magnetizer"
require "lib/wags_site_driver.rb"

require 'yaml'
CREDENTIALS = YAML.load_file(File.expand_path("../creds.yaml", __FILE__))

describe "The Web Driver" do
  it "should log in to the website using selenium" do
    driver = WagsSiteDriver.new :selenium
    driver.log_in(CREDENTIALS)
    sleep 2
    expect(page).to have_content("Logout")
  end

  xit "should load a source file into the magnet creation page" do
    magnetizer = Magnetizer.new("spec/java_hello/Hello.java", "Java")

    driver = WagsSiteDriver.new :selenium
    #driver.log_in(CREDENTIALS)
    sleep 2
    driver.go_to_magnet_problem_creation

    t = Time.new.strftime("%F %r")
    driver.load_title "Julia RSpec #{t}"
    driver.load_description "Automated at #{t}"

    trans = MagnetTranslator.new
    driver.load_class_area trans.translate_to_wags_magnets(magnetizer.emitter.classMagnets)
    driver.load_functions_area trans.translate_to_wags_magnets(magnetizer.emitter.methodMagnets)
    driver.load_statements_area trans.translate_to_wags_magnets(magnetizer.emitter.preambleMagnets + magnetizer.emitter.statementMagnets)

    driver.submit_magnet_problem
  end

  it "should log in to the website using poltergeist" do
    driver = WagsSiteDriver.new :poltergeist
    driver.log_in(CREDENTIALS)
    sleep 2
    expect(page).to have_content("Logout")
  end

  xit "should load a source file into the magnet creation page" do
    magnetizer = Magnetizer.new("spec/java_hello/Hello.java", "Java")

    driver = WagsSiteDriver.new :poltergeist
    #driver.log_in(CREDENTIALS)
    sleep 2
    driver.go_to_magnet_problem_creation

    t = Time.new.strftime("%F %r")
    driver.load_title "Julia RSpec #{t}"
    driver.load_description "Automated at #{t}"

    trans = MagnetTranslator.new
    driver.load_class_area trans.translate_to_wags_magnets(magnetizer.emitter.classMagnets)
    driver.load_functions_area trans.translate_to_wags_magnets(magnetizer.emitter.methodMagnets)
    driver.load_statements_area trans.translate_to_wags_magnets(magnetizer.emitter.preambleMagnets + magnetizer.emitter.statementMagnets)

    driver.submit_magnet_problem
  end
end

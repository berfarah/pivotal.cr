require "spec"
require "../src/pivotal"

def json_fixture(relative_path)
  path = File.expand_path("../fixtures/#{relative_path}.json", __FILE__)
  File.read(path)
end

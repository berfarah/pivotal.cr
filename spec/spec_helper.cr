require "spec"
require "yaml"
require "../src/pivotal"

def json_fixture(relative_path)
  path = File.expand_path("../fixtures/#{relative_path}.json", __FILE__)
  File.read(path)
end

struct Secrets
  def self.load : self
    @@secrets ||= begin
      path = File.expand_path("../fixtures/secrets.yml", __FILE__)
      Secrets.from_yaml(File.read(path))
    end
  end

  YAML.mapping(
    username: String,
    token: String,
  )
end

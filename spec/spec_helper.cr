require "spec"
require "yaml"
require "../src/pivotal"

def json_fixture(relative_path)
  path = File.expand_path("../fixtures/#{relative_path}.json", __FILE__)
  File.read(path)
end

def integration_test?
  ENV["INTEGRATION"]?
end

struct Secrets
  def self.load : self
    @@secrets ||= begin
      Secrets.from_yaml(File.read(path))
    end
  end

  private def self.path
    if integration_test?
      File.expand_path("../fixtures/secrets.yml", __FILE__)
    else
      File.expand_path("../fixtures/secrets.yml.example", __FILE__)
    end
  end

  YAML.mapping(
    username: String,
    token: String,
  )
end

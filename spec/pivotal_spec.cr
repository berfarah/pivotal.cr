require "./spec_helper"

describe Pivotal do
  it "works" do
    if integration_test?
      Pivotal::Client.token = Secrets.load.token

      response = Pivotal::Resource::Me.get
      response.api_token.should eq(Secrets.load.token)

      projects = Pivotal::Resource::Project.all
      project = projects.first
      story = project.stories.first

      foo_story = Pivotal::Resource::Story.all(project.id, with_label: "foo")
    end
  end
end

require "./spec_helper"

describe Pivotal do
  if integration_test?
    it "works" do
      Pivotal::Client.token = Secrets.load.token

      response = Pivotal::Resource::Me.get
      response.api_token.should eq(Secrets.load.token)

      projects = Pivotal::Resource::Project.all
      project = projects.first

      memberships = project.memberships
      membership = memberships.first

      stories = project.stories(with_state: Pivotal::Resource::Story::State::Unstarted)
      story = stories.first?

      iterations = project.iterations(scope: Pivotal::Resource::Iteration::State::Backlog)
      iteration = iterations.first?
    end
  end
end

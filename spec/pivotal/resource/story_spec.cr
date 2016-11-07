require "../../spec_helper"
project_json = json_fixture("story")

describe Pivotal::Resource::Story do
  subject = Pivotal::Resource::Story

  assert do
    project = subject.from_json(project_json)
    project.id.should eq(555)
    project.name.should eq("Bring me the passengers")
    project.description.should eq("ignore the droids")
    project.story_type.should eq(Pivotal::Resource::Story::Type::Feature)
    project.current_state.should eq(Pivotal::Resource::Story::State::Unstarted)
    project.estimate.should eq(2)
    project.requested_by_id.should eq(101)
    project.owner_ids.should eq([] of Int16 | Int32)
    project.created_at.should eq(Time.new(2016, 10, 18, 12))
    project.updated_at.should eq(Time.new(2016, 10, 18, 12))
    project.url.should eq("http://localhost/story/show/555")
  end
end

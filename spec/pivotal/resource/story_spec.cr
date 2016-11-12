require "../../spec_helper"
story_json = json_fixture("story")

describe Pivotal::Resource::Story do
  subject = Pivotal::Resource::Story

  assert do
    story = subject.from_json(story_json)
    story.id.should eq(555)
    story.name.should eq("Bring me the passengers")
    story.description.should eq("ignore the droids")
    story.story_type.should eq(Pivotal::Resource::Story::Type::Feature)
    story.current_state.should eq(Pivotal::Resource::Story::State::Unstarted)
    story.estimate.should eq(2)
    story.requested_by_id.should eq(101)
    story.owner_ids.should eq([] of Int16 | Int32)
    story.created_at.should eq(Time.new(2016, 10, 18, 12))
    story.updated_at.should eq(Time.new(2016, 10, 18, 12))
    story.url.should eq("http://localhost/story/show/555")
  end
end

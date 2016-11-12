require "../../spec_helper"
iteration_json = json_fixture("iteration")

describe Pivotal::Resource::Iteration do
  subject = Pivotal::Resource::Iteration

  assert do
    iteration = subject.from_json(iteration_json)

    iteration.number.should eq(15)
    iteration.project_id.should eq(99)
    iteration.length.should eq(1)
    iteration.team_strength.should eq(1.0)
    iteration.start.should eq(Time.new(2016, 11, 8, 12, 0, 5))
    iteration.finish.should eq(Time.new(2016, 11, 8, 12, 0, 10))
    iteration.stories.first.should be_a(Pivotal::Resource::Story)
  end
end

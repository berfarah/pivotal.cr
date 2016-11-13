require "../../spec_helper"
project_membership_json = json_fixture("project_membership")

describe Pivotal::Resource::ProjectMembership do
  subject = Pivotal::Resource::ProjectMembership

  assert do
    project_membership = subject.from_json(project_membership_json)
    project_membership.id.should eq(16200)

    project_membership.person.id.should eq(106)
    project_membership.person.name.should eq("Galen Marek")
    project_membership.person.email.should eq("marek@sith.mil")
    project_membership.person.initials.should eq("GM")
    project_membership.person.username.should eq("starkiller")

    project_membership.project_color.should eq("b800bb")
    project_membership.project_id.should eq(99)
    project_membership.created_at.should eq(Time.new(2016, 10, 18, 12))
    project_membership.updated_at.should eq(Time.new(2016, 10, 18, 12))
  end
end

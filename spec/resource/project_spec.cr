require "../spec_helper"
project_json = json_fixture("project")

subject = Pivotal::Resource::Project
describe subject do
  assert do
    project = subject.from_json(project_json)
    project.id.should eq(99)
    project.name.should eq("Death Star")
    project.iteration_length.should eq(1)
    project.week_start_day.should eq("Monday")
    project.point_scale.should eq("0,1,2,3")
    project.point_scale_is_custom.should eq(false)
    project.bugs_and_chores_are_estimatable.should eq(false)
    project.automatic_planning.should eq(true)
    project.enable_tasks.should eq(true)
    project.start_date.should eq(Time.new(2016, 7, 4))
    project.start_time.should eq(Time.new(2016, 10, 18, 12, 0, 10))
    project.description.should eq("Expeditionary Battle Planetoid")
    project.profile_content.should eq("This is a machine of war such as the universe has never known. It's colossal, the size of a class-four moon. And it possesses firepower unequaled in the history of warfare.")
    project.project_type.should eq("private")
    project.public.should eq(false)
    project.atom_enabled.should eq(true)
    project.current_iteration_number.should eq(15)
    project.account_id.should eq(100)
  end
end

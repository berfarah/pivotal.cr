require "../../../spec_helper"

describe Pivotal::Resource::Story::Params do
  subject = Pivotal::Resource::Story::Params

  it "it works with one parameter" do
    params = subject.new(with_label: "foo")
    params.to_s.should eq("?with_label=foo")
  end

  it "it works with multiple parameters" do
    params = subject.new(
      with_label: "foo",
      limit: 5,
      offset: 3
    )
    params.to_s.should eq("?with_label=foo&limit=5&offset=3")
  end

  it "converts times" do
    params = subject.new(
      deadline_after: Time.new(2012, 10, 1)
    )
    params.to_s.should eq("?deadline_after=2012-10-01T00:00:00Z")
  end

  describe "given filter" do
    it "outputs the filter" do
      params = subject.new(
        filter: "foo"
      )
      params.to_s.should eq("?filter=foo")
    end

    it "ignores other parameteres" do
      params = subject.new(
        filter: "foo",
        offset: 5
      )
      params.to_s.should eq("?filter=foo")
    end
  end
end

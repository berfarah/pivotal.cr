require "./spec_helper"

describe Pivotal do
  it "works" do
    Pivotal::Client.token = Secrets.load.token

    response = Pivotal::Resource::Me.get
    response.api_token.should eq(Secrets.load.token)
  end
end

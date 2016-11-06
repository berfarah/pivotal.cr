require "./spec_helper"

describe Pivotal do
  it "works" do
    if integration_test?
      Pivotal::Client.token = Secrets.load.token

      response = Pivotal::Resource::Me.get
      response.api_token.should eq(Secrets.load.token)
    end
  end
end

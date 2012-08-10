require 'spec_helper'

describe "UptimeMonitors" do
  describe "GET /uptime_monitors" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get uptime_monitors_path
      response.status.should be(200)
    end
  end
end

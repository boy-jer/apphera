require 'spec_helper'

describe "SystemSettings" do
  describe "GET /system_settings" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get system_settings_path
      response.status.should be(200)
    end
  end
end

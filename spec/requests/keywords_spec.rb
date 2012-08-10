require 'spec_helper'

describe "Keywords" do
  describe "GET /keywords" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get keywords_path
      response.status.should be(302)
    end
  end
end

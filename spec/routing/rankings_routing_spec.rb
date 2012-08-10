require "spec_helper"

describe RankingsController do
  describe "routing" do

    it "routes to #index" do
      get("/rankings").should route_to("rankings#index")
    end

   
  end
end

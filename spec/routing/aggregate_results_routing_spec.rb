require "spec_helper"

describe AggregateResultsController do
  describe "routing" do

    it "routes to #index" do
      get("/aggregate_results").should route_to("aggregate_results#index")
    end

   

  end
end

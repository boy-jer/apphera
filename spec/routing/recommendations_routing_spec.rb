require "spec_helper"

describe RecommendationsController do
  describe "routing" do

    it "routes to #index" do
      get("/recommendations").should route_to("recommendations#index")
    end

    it "routes to #new" do
      get("/recommendations/new").should route_to("recommendations#new")
    end

    it "routes to #show" do
      get("/recommendations/1").should route_to("recommendations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/recommendations/1/edit").should route_to("recommendations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/recommendations").should route_to("recommendations#create")
    end

    it "routes to #update" do
      put("/recommendations/1").should route_to("recommendations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/recommendations/1").should route_to("recommendations#destroy", :id => "1")
    end

  end
end

require "spec_helper"

describe KeywordsController do
  describe "routing" do

    it "routes to #index" do
      get("/keywords").should route_to("keywords#index")
    end

    it "routes to #new" do
      get("/keywords/new").should route_to("keywords#new")
    end

    it "routes to #show" do
      get("/keywords/1").should route_to("keywords#show", :id => "1")
    end

    it "routes to #edit" do
      get("/keywords/1/edit").should route_to("keywords#edit", :id => "1")
    end

    it "routes to #create" do
      post("/keywords").should route_to("keywords#create")
    end

    it "routes to #update" do
      put("/keywords/1").should route_to("keywords#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/keywords/1").should route_to("keywords#destroy", :id => "1")
    end

  end
end

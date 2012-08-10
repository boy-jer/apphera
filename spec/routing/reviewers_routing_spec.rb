require "spec_helper"

describe ReviewersController do
  describe "routing" do

    it "routes to #index" do
      get("/reviewers").should route_to("reviewers#index")
    end

    it "routes to #new" do
      get("/reviewers/new").should route_to("reviewers#new")
    end

    it "routes to #show" do
      get("/reviewers/1").should route_to("reviewers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/reviewers/1/edit").should route_to("reviewers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/reviewers").should route_to("reviewers#create")
    end

    it "routes to #update" do
      put("/reviewers/1").should route_to("reviewers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/reviewers/1").should route_to("reviewers#destroy", :id => "1")
    end

  end
end

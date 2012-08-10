require "spec_helper"

describe MyCompetitorsController do
  describe "routing" do

    it "routes to #index" do
      get("/new_organizations").should route_to("new_organizations#index")
    end

    it "routes to #new" do
      get("/new_organizations/new").should route_to("new_organizations#new")
    end

    it "routes to #show" do
      get("/new_organizations/1").should route_to("new_organizations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/new_organizations/1/edit").should route_to("new_organizations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/new_organizations").should route_to("new_organizations#create")
    end

    it "routes to #update" do
      put("/new_organizations/1").should route_to("new_organizations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/new_organizations/1").should route_to("new_organizations#destroy", :id => "1")
    end

  end
end

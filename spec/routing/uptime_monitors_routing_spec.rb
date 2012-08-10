require "spec_helper"

describe UptimeMonitorsController do
  describe "routing" do

    it "routes to #index" do
      get("/uptime_monitors").should route_to("uptime_monitors#index")
    end

    it "routes to #new" do
      get("/uptime_monitors/new").should route_to("uptime_monitors#new")
    end

    it "routes to #show" do
      get("/uptime_monitors/1").should route_to("uptime_monitors#show", :id => "1")
    end

    it "routes to #edit" do
      get("/uptime_monitors/1/edit").should route_to("uptime_monitors#edit", :id => "1")
    end

    it "routes to #create" do
      post("/uptime_monitors").should route_to("uptime_monitors#create")
    end

    it "routes to #update" do
      put("/uptime_monitors/1").should route_to("uptime_monitors#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/uptime_monitors/1").should route_to("uptime_monitors#destroy", :id => "1")
    end

  end
end

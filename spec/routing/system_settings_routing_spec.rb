require "spec_helper"

describe SystemSettingsController do
  describe "routing" do

    it "routes to #index" do
      get("/system_settings").should route_to("system_settings#index")
    end

    it "routes to #new" do
      get("/system_settings/new").should route_to("system_settings#new")
    end

    it "routes to #show" do
      get("/system_settings/1").should route_to("system_settings#show", :id => "1")
    end

    it "routes to #edit" do
      get("/system_settings/1/edit").should route_to("system_settings#edit", :id => "1")
    end

    it "routes to #create" do
      post("/system_settings").should route_to("system_settings#create")
    end

    it "routes to #update" do
      put("/system_settings/1").should route_to("system_settings#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/system_settings/1").should route_to("system_settings#destroy", :id => "1")
    end

  end
end

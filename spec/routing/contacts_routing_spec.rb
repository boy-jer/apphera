require "spec_helper"

describe ContactsController do
  describe "routing" do

    it "routes to #index" do
      get("/contacts").should route_to("contacts#index")
    end

    it "routes to #new" do
      get("/contacts/new").should route_to("contacts#new")
    end

    
  end
end

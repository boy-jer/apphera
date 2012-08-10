require "spec_helper"

describe AccountsController do
  describe "routing" do

    it "routes to #index" do
      get("/accounts").should route_to("accounts#index")
    end

    

  end
end

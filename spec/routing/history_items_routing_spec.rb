require "spec_helper"

describe HistoryItemsController do
  describe "routing" do

    it "routes to #index" do
      get("/history_items").should route_to("history_items#index")
    end

   

  end
end

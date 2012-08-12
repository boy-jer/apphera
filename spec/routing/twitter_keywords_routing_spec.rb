require "spec_helper"

describe TwitterKeywordsController do
  describe "routing" do

    it "routes to #index" do
      get("/twitter_keywords").should route_to("twitter_keywords#index")
    end

    it "routes to #new" do
      get("/twitter_keywords/new").should route_to("twitter_keywords#new")
    end

    it "routes to #show" do
      get("/twitter_keywords/1").should route_to("twitter_keywords#show", :id => "1")
    end

    it "routes to #edit" do
      get("/twitter_keywords/1/edit").should route_to("twitter_keywords#edit", :id => "1")
    end

    it "routes to #create" do
      post("/twitter_keywords").should route_to("twitter_keywords#create")
    end

    it "routes to #update" do
      put("/twitter_keywords/1").should route_to("twitter_keywords#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/twitter_keywords/1").should route_to("twitter_keywords#destroy", :id => "1")
    end

  end
end

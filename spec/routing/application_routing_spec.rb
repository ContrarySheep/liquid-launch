require "spec_helper"

describe ApplicationController do
  describe "routing" do

    it "routes to #index" do
      get("/").should route_to("application#index")
    end
    
    it "routes to #results as html" do
      get("/results").should route_to("application#results")
    end
    
    it "routes to #results as plist" do
      get("/com.liquid-launch.plist").should route_to("application#results", :plist_name => 'com.liquid-launch.plist')
    end

  end
end

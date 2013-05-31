require "spec_helper"

describe Heroku::DashboardsController do
  describe "routing" do

    it "routes to #show" do
      get("/heroku/dashboard").should route_to("heroku/dashboards#show")
    end

  end
end

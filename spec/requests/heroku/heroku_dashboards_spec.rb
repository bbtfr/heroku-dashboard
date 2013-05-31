require 'spec_helper'

describe "Heroku::Dashboards" do
  describe "GET /heroku_dashboards" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get heroku_dashboard_path
      response.status.should be(200)
    end
  end
end

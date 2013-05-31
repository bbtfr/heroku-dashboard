require "spec_helper"

describe Heroku::AccountsController do
  describe "routing" do

    it "routes to #index" do
      get("/heroku/accounts").should route_to("heroku/accounts#index")
    end

    it "routes to #new" do
      get("/heroku/accounts/new").should route_to("heroku/accounts#new")
    end

    it "routes to #show" do
      get("/heroku/accounts/1").should route_to("heroku/accounts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/heroku/accounts/1/edit").should route_to("heroku/accounts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/heroku/accounts").should route_to("heroku/accounts#create")
    end

    it "routes to #update" do
      put("/heroku/accounts/1").should route_to("heroku/accounts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/heroku/accounts/1").should route_to("heroku/accounts#destroy", :id => "1")
    end

  end
end

require 'spec_helper'

describe "heroku/accounts/show" do
  before(:each) do
    @heroku_account = build_stubbed :heroku_account
  end

  let :attributes do
    attributes_for :heroku_account
  end

  it "renders attributes in <p>" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "p", :text => "Apikey:#{attributes[:apikey]}"
  end
end

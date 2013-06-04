require 'spec_helper'

describe "heroku/accounts/index" do
  before(:each) do
    @heroku_accounts = Array.new 2, build_stubbed(:heroku_account)
  end

  let :attributes do
    attributes_for :heroku_account
  end

  it "renders a list of heroku/accounts" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "#{attributes[:apikey]}", :count => 2
  end
end

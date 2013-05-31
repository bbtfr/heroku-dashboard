require 'spec_helper'

describe "heroku/accounts/edit" do
  before(:each) do
    @heroku_account = build_stubbed :heroku_account
  end

  it "renders the edit heroku_account form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", heroku_account_path(@heroku_account), "post" do
      assert_select "input#heroku_account_apikey[name=?]", "heroku_account[apikey]"
    end
  end
end

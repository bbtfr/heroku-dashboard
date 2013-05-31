require 'spec_helper'

describe "heroku/accounts/new" do
  before(:each) do
    @heroku_account = build :heroku_account
  end

  it "renders new heroku_account form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", heroku_accounts_path, "post" do
      assert_select "input#heroku_account_apikey[name=?]", "heroku_account[apikey]"
    end
  end
end

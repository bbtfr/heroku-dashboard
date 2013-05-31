require 'spec_helper'

describe Heroku::App do
  before(:all) do
    @account = build(:heroku_account)
    @account.save
  end
  after(:all) do
    @account.delete
  end
end

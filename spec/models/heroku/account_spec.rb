require 'spec_helper'

describe Heroku::Account do
  before(:all) do
    @account = build(:heroku_account)
    @account.save
  end

  subject { @account }

  it { should be_valid }

  it { should validate_presence_of :apikey }
  it { should validate_uniqueness_of :apikey }

  after(:all) do
    @account.delete
  end
end

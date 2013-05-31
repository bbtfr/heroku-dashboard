require 'spec_helper'

describe Heroku::Account do
  let(:account) { create :heroku_account }

  subject { account }

  it { should be_valid }

  it { should validate_presence_of :apikey }
  it { should validate_uniqueness_of :apikey }
end

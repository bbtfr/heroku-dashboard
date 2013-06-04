require 'spec_helper'

describe Heroku::App do
  before(:each) { create :heroku_account }

  describe "collection" do
    let(:apps) { Heroku::App.all }
    
    subject { apps }

    it { should be_any }
  end

  describe "member" do
    let(:app) { Heroku::App.first }

    subject { app }

    it { should belong_to :account }
  end
end

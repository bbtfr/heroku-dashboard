# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :heroku_account, :class => 'Heroku::Account' do
    apikey "01205863-7eeb-45da-8eed-0d9d3d37ceef"
  end
end

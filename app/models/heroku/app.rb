class Heroku::App < ActiveResource::Base
  include Heroku::Base

  belongs_to :account, class_name: 'Heroku::Account'
end

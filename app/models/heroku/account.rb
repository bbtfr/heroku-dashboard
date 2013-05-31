class Heroku::Account < ActiveRecord::Base
  validates :apikey, :presence => true, :uniqueness => true
end

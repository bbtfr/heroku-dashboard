class Heroku::Account < ActiveRecord::Base
  validates :apikey, presence: true, uniqueness: true

  has_many :apps, class_name: 'Heroku::App'
end

module Heroku::SubBase
  extend ActiveSupport::Concern

  included do
    self.user = ""
    self.site = "https://api.heroku.com/"
  end
end
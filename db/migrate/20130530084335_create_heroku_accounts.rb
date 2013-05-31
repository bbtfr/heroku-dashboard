class CreateHerokuAccounts < ActiveRecord::Migration
  def change
    create_table :heroku_accounts do |t|
      t.string :apikey

      t.timestamps
    end
  end
end

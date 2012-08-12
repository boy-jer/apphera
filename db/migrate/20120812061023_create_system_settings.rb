class CreateSystemSettings < ActiveRecord::Migration
  def change
    create_table :system_settings do |t|
      t.string :bunny_host
      t.string :bunny_user
      t.string :bunny_password
      t.string :twitter_consumer_key
      t.string :twitter_consumer_secret
      t.string :twitter_oauth_token
      t.string :twitter_oauth_token_secret
      t.string :facebook_api_key
      t.string :facebook_api_secret
      t.string :bing_api_key
      t.string :google_api_key

      t.timestamps
    end
  end
end

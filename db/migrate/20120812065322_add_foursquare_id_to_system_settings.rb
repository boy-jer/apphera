class AddFoursquareIdToSystemSettings < ActiveRecord::Migration
  def change
    add_column :system_settings, :foursquare_client_id, :string
    add_column :system_settings, :foursquare_client_secret, :string
  end
end

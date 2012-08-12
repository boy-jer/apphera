class AddBestPasswdToSystemSettings < ActiveRecord::Migration
  def change
    add_column :system_settings, :best_proxy_password, :string
  end
end

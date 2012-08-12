class CreateTwitterKeywords < ActiveRecord::Migration
  def change
    create_table :twitter_keywords do |t|
      t.string :name

      t.timestamps
    end
    add_index :twitter_keywords, :name
  end
end

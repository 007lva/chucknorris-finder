class CreateResults < ActiveRecord::Migration[6.1]
  def change
    create_table :results do |t|
      t.string :query, null: false
      t.string :icon_url
      t.string :api_id
      t.string :url
      t.text :value
      t.timestamps
    end
  end
end

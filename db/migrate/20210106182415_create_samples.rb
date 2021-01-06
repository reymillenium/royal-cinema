class CreateSamples < ActiveRecord::Migration[6.0]
  def change
    create_table :samples do |t|
      t.string :title, null: false
      t.string :sub_title, null: false
      t.string :url, null: false

      t.timestamps
    end
  end
end

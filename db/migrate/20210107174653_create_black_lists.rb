class CreateBlackLists < ActiveRecord::Migration[6.0]
  def change
    create_table :black_lists do |t|
      t.string :value
      t.string :black_list_type

      t.timestamps
    end
  end
end

class CreateAuditorium < ActiveRecord::Migration[6.0]
  def up
    create_table :auditoriums do |t|
      t.string :name

      t.timestamps
    end
  end

  def down
    drop_table :auditoriums
  end
end

class CreateReferences < ActiveRecord::Migration[6.0]
  def up
    create_table :references do |t|
      t.string :full_name
      t.string :current_job_title
      t.string :linkedin_profile
      t.string :email
      t.string :mobile_number
      t.datetime :pertinent_date, null: true

      t.timestamps
    end
  end

  def down
    drop_table :references
  end
end

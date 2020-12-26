class CreateReferences < ActiveRecord::Migration[6.0]
  def change
    create_table :references do |t|
      t.string :full_name
      t.string :current_job_title
      t.string :linkedin_profile
      t.string :mobile_number
      t.datetime :pertinent_date

      t.timestamps
    end
  end
end

class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :message
      t.datetime :execution_date

      t.timestamps
    end
  end
end

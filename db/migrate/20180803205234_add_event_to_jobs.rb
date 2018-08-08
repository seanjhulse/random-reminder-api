class AddEventToJobs < ActiveRecord::Migration[5.2]
  def change
    add_reference :jobs, :event, foreign_key: true
  end
end

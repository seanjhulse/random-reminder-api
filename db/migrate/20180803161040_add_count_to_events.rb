class AddCountToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :count, :integer
  end
end

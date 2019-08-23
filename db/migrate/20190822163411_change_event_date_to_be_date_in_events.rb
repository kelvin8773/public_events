class ChangeEventDateToBeDateInEvents < ActiveRecord::Migration[5.2]
  def change
    change_column :events, :event_date, :date
  end
end

class RenameHeldOnToEventDate < ActiveRecord::Migration[5.2]
  def change
    rename_column :events, :held_on, :event_date
  end
end

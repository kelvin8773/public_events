class AddCreatorToEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :creator, :string
  end
end

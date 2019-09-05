# frozen_string_literal: true

class AddAvatorToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :avator, :text
  end
end

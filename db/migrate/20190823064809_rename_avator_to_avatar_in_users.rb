# frozen_string_literal: true

class RenameAvatorToAvatarInUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :avator, :avatar
  end
end

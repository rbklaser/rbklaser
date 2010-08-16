class DeleteHasAvatarFromUser < ActiveRecord::Migration
  def self.up
    remove_column :users, :has_avatar
  end

  def self.down
  end
end

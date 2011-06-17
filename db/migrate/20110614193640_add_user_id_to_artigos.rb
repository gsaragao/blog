class AddUserIdToArtigos < ActiveRecord::Migration
  def self.up
    add_column :artigos, :usuario_id, :integer
  end

  def self.down
    remove_column :artigos, :usuario_id
  end
end

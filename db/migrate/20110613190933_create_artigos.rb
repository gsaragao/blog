class CreateArtigos < ActiveRecord::Migration
  def self.up
    create_table :artigos do |t|
      t.string :titulo
      t.text :corpo
      t.datetime :publicacao
      t.timestamps 
    end
  end

  def self.down
    drop_table :artigos
  end
end

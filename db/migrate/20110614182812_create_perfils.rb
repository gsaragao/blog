class CreatePerfils < ActiveRecord::Migration
  def self.up
    create_table :perfils do |t|
      t.integer :usuario_id
      t.string :nome
      t.date :aniversario
      t.string :twitter

      t.timestamps
    end
  end

  def self.down
    drop_table :perfils
  end
end

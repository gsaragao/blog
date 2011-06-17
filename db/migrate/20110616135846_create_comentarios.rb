class CreateComentarios < ActiveRecord::Migration
  def self.up
    create_table :comentarios do |t|
      t.integer :artigo_id
      t.string :nome
      t.string :email
      t.text :corpo

      t.timestamps
    end
  end

  def self.down
    drop_table :comentarios
  end
end

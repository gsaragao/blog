class CreateArtigosCategorias < ActiveRecord::Migration
  def self.up
    create_table :artigos_categorias, :id => false do |t|
      t.references :artigo
      t.references :categoria
    end
    
  end

  def self.down
    drop_table :artigos_categorias
  end
end
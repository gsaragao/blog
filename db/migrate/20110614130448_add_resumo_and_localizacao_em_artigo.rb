class AddResumoAndLocalizacaoEmArtigo < ActiveRecord::Migration
  def self.up
      add_column :artigos, :resumo, :string
      add_column :artigos, :localizacao, :string
  end

  def self.down
      remove_column :artigos, :resumo
      remove_column :artigos, :localizacao
  end
end

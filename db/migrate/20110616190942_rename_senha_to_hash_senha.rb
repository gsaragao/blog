class RenameSenhaToHashSenha < ActiveRecord::Migration
  def self.up
      rename_column :usuarios, :senha, :hash_senha
  end

  def self.down
      rename_column :usuarios, :hash_senha, :senha 
  end
end

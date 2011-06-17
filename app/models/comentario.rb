class Comentario < ActiveRecord::Base
  belongs_to :artigo
  
  validates :nome, :corpo, :presence => true
  validate :artigo_ja_foi_publicado
  
  def artigo_ja_foi_publicado
      errors.add(:artigo_id, "nao foi publicado ainda") if artigo && !artigo.publicado?
  end

end

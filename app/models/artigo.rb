class Artigo < ActiveRecord::Base
  validates :titulo, :presence => true
  validates :corpo, :presence => true
  
  belongs_to :usuario
  has_and_belongs_to_many :categorias
  has_many :comentarios
  
  scope :publicado, where('artigos.publicacao IS NOT NULL')
  scope :rascunho,  where('artigos.publicacao IS NULL')
  scope :recente, lambda { publicado.where("artigos.publicacao > ?", 1.week.ago.to_date)}
  scope :where_titulo, lambda {|term| where("artigos.titulo LIKE ?", "%#{term}%") }
  
  def titulo_longo
    "#{titulo} - #{publicacao}" 
  end  
  
  def publicado?
      publicacao.present?
  end
  
  def proprio?(proprio)
      return false unless proprio.is_a? Usuario
      usuario == proprio
  end

end

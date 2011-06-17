require 'digest'
class Usuario < ActiveRecord::Base
  attr_accessor :senha
  validates :email, :uniqueness => true
  validates :senha, :confirmation => true, 
                    :length => { :within => 4..20 },
                    :presence => true,
                    :if => :senha_requirida?  
  
  has_one :perfil
  has_many :artigos, :dependent => :destroy 
  has_many :respostas, :through => :artigos, :source => :comentarios
  
  before_save :encriptar_nova_senha
  
  def self.autenticar(email, senha)
     usuario = find_by_email(email)
     return usuario if usuario && usuario.autenticado?(senha)
  end
  
  def autenticado?(senha)
     self.hash_senha == encriptar(senha)   
  end
  
  protected
  def encriptar_nova_senha
      return if senha.blank?
      self.hash_senha = encriptar(senha)
  end
  
  def senha_requirida?
      hash_senha.blank? || senha.present?
  end
  
  def encriptar(string)
    Digest::SHA1.hexdigest(string)  
  end  
end

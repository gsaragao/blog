module ArtigosHelper  
  
  def publicacaoArtigo(artigo)
      artigo.publicacao.strftime("publicado em %d/%m/%Y - %H:%M") + " por " + artigo.usuario.email
  end
     
end

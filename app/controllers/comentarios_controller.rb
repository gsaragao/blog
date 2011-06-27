# encoding : utf-8
class ComentariosController < ApplicationController
  before_filter :carrega_artigo, :except => :destroy
  before_filter :authenticate, :only => :destroy
  

  def create
      @comentario = @artigo.comentarios.new(params[:comentario])

      if @comentario.save
         redirect_to @artigo, :notice => 'Obrigado por seu comentário!'  
      else
         redirect_to @artigo, :alert => 'Não permite comentário.'     
      end  
  end

  def destroy
      @artigo = current_user.artigos.find(params[:artigo_id])
      @comentario = @artigo.comentarios.find(params[:id]) 
      @comentario.destroy
      redirect_to @artigo, :notice => 'Comentário excluído com sucesso!'
  end

  private
  
  def carrega_artigo
       @artigo = Artigo.find(params[:artigo_id])
  end
  
end

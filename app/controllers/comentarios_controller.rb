# encoding : utf-8
class ComentariosController < ApplicationController
  before_filter :carrega_artigo, :except => :destroy
  before_filter :authenticate, :only => :destroy
  respond_to :html, :js

  def create
      @comentario = @artigo.comentarios.new(params[:comentario])
      if @comentario.save
         respond_with @artigo, :notice => 'Obrigado por seu comentário!'  
      else
         respond_with(@artigo) do |format|
           format.html { redirect_to @artigo, :alert => 'Não permite comentário.'}
           format.js { render 'fail_create.js.erb'}  
         end
      end  
  end

  def destroy
      @artigo = current_user.artigos.find(params[:artigo_id])
      @comentario = @artigo.comentarios.find(params[:id]) 
      @comentario.destroy
      respond_with @artigo, :notice => 'Comentário excluído com sucesso!'
  end

  private
  
  def carrega_artigo
       @artigo = Artigo.find(params[:artigo_id])
  end
  
end

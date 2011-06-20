# encoding : utf-8
class ArtigosController < ApplicationController

respond_to :html

  def index
    @artigos = Artigo.all
    respond_with @artigos
  end

  def show
    @artigo = Artigo.find(params[:id])
    respond_with @artigo
  end

  def new
    @artigo = Artigo.new
    respond_with @artigo
  end

  def edit
    @artigo = Artigo.find(params[:id])
  end

  def create
    @artigo = Artigo.new(params[:artigo])
    
    if @artigo.save
      flash[:notice] = "O artigo '#{@artigo.titulo}' foi criada com sucesso."
      redirect_to artigos_path
    else
      render :action => :new 
    end
     
  end

  def update
    @artigo = Artigo.find(params[:id])

    if @artigo.update_attributes(params[:artigo])
      flash[:notice] = "O artigo '#{@artigo.titulo}' foi atualizado com sucesso."
      redirect_to artigos_path
    else
      render :action => :edit
    end
end

  def destroy
    @artigo = Artigo.find(params[:id])
    @artigo.destroy
    flash[:notice] = "O artigo '#{@artigo.titulo}' foi excluída com sucesso."
    redirect_to artigos_path
  end
end

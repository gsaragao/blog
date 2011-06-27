# encoding : utf-8
class ArtigosController < ApplicationController
  before_filter :authenticate, :except => [:index, :show]
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
    @artigo = current_user.artigos.find(params[:id])
  end

  def create
    @artigo = current_user.artigos.new(params[:artigo])
    
    if @artigo.save
      flash[:notice] = "O artigo '#{@artigo.titulo}' foi criada com sucesso."
      redirect_to artigos_path
    else
      render :action => :new 
    end
     
  end

  def update
    @artigo = current_user.artigos.find(params[:id])

    if @artigo.update_attributes(params[:artigo])
      flash[:notice] = "O artigo '#{@artigo.titulo}' foi atualizado com sucesso."
      redirect_to artigos_path
    else
      render :action => :edit
    end
end

  def destroy
    @artigo = current_user.artigos.find(params[:id])
    @artigo.destroy
    flash[:notice] = "O artigo '#{@artigo.titulo}' foi excluída com sucesso."
    redirect_to artigos_path
  end
end

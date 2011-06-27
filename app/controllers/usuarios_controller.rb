# encoding : utf-8
class UsuariosController < ApplicationController
  before_filter :authenticate, :only => [:edit, :update]

  def index
    @usuarios = Usuario.all
  end

  def new
     @usuario = Usuario.new
  end
  
  def create
     @usuario = Usuario.new(params[:usuario]) 
     if @usuario.save
        redirect_to usuarios_path, :notice  => 'Usuário adicionado com sucesso.' 
      else
        render :action => :new
     end
  end  
  
  def edit
     @usuario = current_user
  end
  
  def update
     @usuario = current_user
     if @usuario.update_attributes(params[:usuario])
         redirect_to usuarios_path, :notice  => 'Usuário atualizado com sucesso.' 
       else
         render :action => :edit
      end
  end
end
  
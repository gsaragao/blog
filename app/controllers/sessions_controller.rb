# encoding : utf-8
class SessionsController < ApplicationController
  
  def create
      if usuario = Usuario.autenticar(params[:email], params[:senha])
         session[:usuario_id] = usuario.id
         redirect_to root_path, :notice => 'Logado com sucesso!'
      else
         flash.now[:alert] = 'Login/senha inválidos'  
         render :action => :new
      end       
  end
  
  def destroy
      reset_session
      redirect_to root_path, :notice => "Sessão finalizada com sucesso!"
  end
  
end

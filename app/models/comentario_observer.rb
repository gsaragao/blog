class ComentarioObserver < ActiveRecord::Observer

  def after_create(comentario) 
      puts "Voce ira notificar o autor capitulo 9"
  end

end

class StaticPagesController < ApplicationController
  def home
  	if logged_in? 
  		@udefineprotege = Protege.new
  		@udefinetrainer = Trainer.new
  		if params[:commit] == 'Jestem podopiecznym'
  			flash.now[:danger] = 'Jestem podopiecznym'
  		elsif params[:commit] == 'Jestem trenerem'
  			flash.now[:danger] = 'Jestem trenerem'
  		end	
  	end
  end

  def about
  	
  end

  def create

  end

  def contact

  end

end

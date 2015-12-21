class ProtegesController < ApplicationController
  def show
  end

  def create
  	if Trainer.find_by(user_id: session[:user_id]).nil?
	  	@protege = Protege.new
	  	@protege.user_id = session[:user_id]
	  	@protege.save
	  	@card = Card.new
	  	@card.protege_id = @protege.id.to_i
	  	@card.save
	end
  	redirect_to root_path
  end


end

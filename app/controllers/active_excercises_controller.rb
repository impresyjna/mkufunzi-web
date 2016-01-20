class ActiveExcercisesController < ApplicationController

  def show
  	@active_protege = current_user.trainer.proteges
  end

  def active
  	@active_protege = current_user.trainer.proteges
	respond_to do |format|
		format.js
	end 	
  end
end
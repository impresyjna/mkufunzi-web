class TrainingsController < ApplicationController
  #Displays all current user trainings.  
  def show
  	@trainings = current_user.protege.training
  end

  #Displays selected training.
  def show_details
  	if params[:id]
  		@training = current_user.protege.training.find(params[:id])
  	else	
  		redirect_to root_url
  	end
  end
end

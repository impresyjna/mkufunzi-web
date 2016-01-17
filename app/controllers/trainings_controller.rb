class TrainingsController < ApplicationController
  def show
  	@trainings = current_user.protege.training
  end

  def show_details
  	if params[:id]
  		@training = current_user.protege.training.find(params[:id])
  	else	
  		redirect_to root_url
  	end
  end
end

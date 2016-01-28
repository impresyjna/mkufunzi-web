class TrainingsController < ApplicationController
  #Displays all current user trainings.  
  def show
  	if !current_user.protege.nil? 
  		@trainings = current_user.protege.training
  	end
  	 if !current_user.trainer.proteges.nil? 
  		@trainings = User.find(params[:id]).protege.training
  	end
  end

  #Displays selected training.
  def show_details
  	if params[:id]
  		@training = Training.find(params[:id])
  	else	
  		redirect_to root_url
  	end
end

	def create_training_mobile
		if(!params[:protege_id].nil?)
			@training = Training.new(training_mobile)
			@training.save
			render json: {status: "success", training: @training}
		else
			render json: {status: "failure"}
		end
	end

	def update_training_mobile
		if(!params[:id].nil?)
			@training = Training.find(params[:id])
			if @training.update_attributes(training_mobile)
				render json: {status: "success"}
			else
				render json: {status: "failure"}
			end
		else
			render json: {status: "failure"}
		end

	end

	private
	def training_mobile
		params.permit(:protege_id, :start, :end, :comment)
	end
end

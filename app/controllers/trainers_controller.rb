class TrainersController < ApplicationController
	before_filter :trainer_only,  :except => :create

	def create
		@trainer = Trainer.new
		@trainer.user_id = session[:user_id]
		@trainer.active = 0
		@trainer.save
		redirect_to root_path
	end

	def my_proteges
		@my_proteges = Trainer.find_by(user_id: session[:user_id]).proteges.joins(:user).includes(:user)
		@av_proteges = Protege.new
	end

	def add_protege
		@new_protege = Protege.find_by(user_id:params[:user_id])
		flash[:success] = @new_protege.gender.to_s
		redirect_to my_protege_path 
	end

	private

		def trainer_only
			if logged_in?
				if Trainer.find_by(user_id: current_user.id.to_i).nil?
					redirect_to root_path, :alert => "Odmowa dostępu"
				elsif !active_trainer?
					redirect_to root_path, :alert => "Odmowa dostępu, musisz byc aktywnym trenerem" 
				end

			else
				redirect_to root_path, :alert => "Odmowa dostępu"
			end
		end

		def active_trainer?
			Trainer.find_by(user_id: current_user.id.to_i).active
		end

		def new_protege_params
  			params.require(:protege).permit(:user_id)
  		end


end

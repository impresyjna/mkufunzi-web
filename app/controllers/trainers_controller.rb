#All methods related to Trainers. Create, displaying all trainers group in active and insactive. Some methods are only for trainers and some are only for trainers.
class TrainersController < ApplicationController
	before_filter :trainer_only,  :except => [:create, :show_trainer, :activate_trainer, :disactivate_trainer]
	before_action :admin_only,   only: [:show_inactive_trainer, :activate_trainer]

	#Add new trainer to database. Only not declared current user can add record.
	def create
		@trainer = Trainer.new
		@trainer.user_id = session[:user_id]
		@trainer.active = 0
		@trainer.save
		redirect_to root_path
	end

	# Returns all trainers divided into two groupd: inactive and active. Only for admin. 
	def show_trainer
		@inactive_trainer = Trainer.where(active: false).joins(:user)
		@active_trainer = Trainer.where(active: true).joins(:user)
	end

	# Activate inactive trainer. Only for admin.
	def activate_trainer
		@trainer = Trainer.find_by(id: params[:id])
		@trainer.active = 1
		if @trainer.save
			flash[:success] = @trainer.user.name.to_s + " " + @trainer.user.surname.to_s + " został aktywowany"
			redirect_to trainers_path
		else
			flash[:danger] = "Nie udalo sie aktywowac trenera"
		end
	end

	# Disactivate active trainer. Only for admin.
	def disactivate_trainer
		@trainer = Trainer.find_by(id: params[:id])
		@trainer.active = 0
		if @trainer.save
			flash[:success] = @trainer.user.name.to_s + " " + @trainer.user.surname.to_s + " został dezaktywowany"
			redirect_to trainers_path
		else
			flash[:danger] = "Nie udalo sie dezaktywowac trenera"
		end
	end

	private

		# Returns true if current user is admin.
		def admin_only
			if logged_in?
				if User.find_by(id: current_user.id.to_i).admin != true
					redirect_to root_path, :alert => "Odmowa dostępu musisz być adminem"
				end
			end
		end

		#Returns true if current user is active trainer.
		def trainer_only
			if logged_in?
				if Trainer.find_by(user_id: current_user.id.to_i).nil?
					redirect_to root_path, :alert => "Odmowa dostępu111"
				elsif !active_trainer?
					redirect_to root_path, :alert => "Odmowa dostępu, musisz byc aktywnym trenerem" 
				end

			else
				redirect_to root_path, :alert => "Odmowa dostępu"
			end
		end

		#Returns true if trainer is active.
		def active_trainer?
			Trainer.find_by(user_id: current_user.id.to_i).active
		end

		def new_protege_params
  			params.require(:protege).permit(:user_id)
  		end


end

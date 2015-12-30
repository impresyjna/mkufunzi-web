class ProtegesController < ApplicationController
	before_action :trainer_only,   only: [:my_proteges, :add_trainer_to_protege, :erase_trainer_from_protege]

	def show
	end

	def my_proteges
		@my_proteges = Trainer.find_by(user_id: session[:user_id]).proteges.joins(:user).includes(:user)
		@av_proteges = Protege.where("trainer_id is NULL").joins(:user).pluck("users.name","users.surname", :id)
		@av_proteges.each do |f|
			f[0] = f[0] + " " + f[1]
		end
		@erase_trainer_from_protege = Protege.new
	end

	def add_trainer_to_protege
		@new_protege = Protege.find_by(id: params[:user_id])
		t = Trainer.find_by(user_id: session[:user_id]).id
		@new_protege.trainer_id = t
		if @new_protege.save
			flash[:success] = "Przypisano podopiecznego do trenera"
			redirect_to my_proteges_path 
		else
			flash[:danger] = "Nie udało się przypisać podpiecznego do trenera"
		end
	end

	def erase_trainer_from_protege
		@protege = Protege.find_by(id: params[:id])
		@protege.trainer_id = nil
		if @protege.save
			flash[:success] = "Usunięto podopiecznego"
			redirect_to my_proteges_path
		else
			flash[:danger] = "Cos poszlo nie tak..."
		end
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


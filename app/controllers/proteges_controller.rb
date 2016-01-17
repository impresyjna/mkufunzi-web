class ProtegesController < ApplicationController
	before_action :trainer_only,   only: [:my_proteges, :add_trainer_to_protege, :erase_trainer_from_protege], except: [:update_from_mobile]

	def show
	end

	def update
	    @protege = current_user.protege
	    @protege.gender = params[:gender]
	    @protege.eye_color_id = params[:eye_color]
	    @protege.blood_type_id = params[:blood_type]
	    if @protege.update_attributes(protege_params)
	      flash[:success] = "Pomyślnie zmieniono"
	      redirect_to edit_profile_path
	    else
	      flash[:danger] = "Nie udalo się edytować"
	      redirect_to edit_profile_path
	    end
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
  	redirect_to edit_profile_path
  end

	def update_from_mobile
		if !params[:id].nil?
			@protege = Protege.find(params[:id])
			if @protege.update_attributes(protege_mobile)
				render json: {status: "success"}
			else
				render json: {status: "failure"}
			end
		else
			render json: {status: "failure"}
		end

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

	def protege_params
		params.require(:protege).permit(:gender,:eye_color,:blood_type,:birth_date)
	end

	def protege_mobile
		params.permit(:gender, :eye_color_id, :blood_type_id, :birth_date)
	end

end


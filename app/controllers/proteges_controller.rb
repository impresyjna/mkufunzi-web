class ProtegesController < ApplicationController
  def show
  end

	def my_proteges
		@my_proteges = Trainer.find_by(user_id: session[:user_id]).proteges.joins(:user).includes(:user)
		@av_proteges = Protege.where("trainer_id is NULL").joins(:user).pluck("users.name","users.surname", :id)
		@av_proteges.each do |f|
			f[0] = f[0] + " " + f[1]
		end
	end

	def add_trainer_to_protege
		@new_protege = Protege.find_by(id: params[:user_id])
		t = Trainer.find_by(user_id: session[:user_id]).id
		@new_protege.trainer_id = t
		@new_protege.save
		redirect_to my_proteges_path 
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

	def new_protege_params
		params.require(:protege).permit(:user_id)
	end

end


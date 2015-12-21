class TrainersController < ApplicationController
	def create
		@trainer = Trainer.new
		@trainer.user_id = session[:user_id]
		@trainer.save
		redirect_to root_path
	end

	def my_proteges
		@my_proteges = Trainer.find_by(user_id: session[:user_id]).proteges.joins(:user).includes(:user)
	end

	def add_protege
	end

end
